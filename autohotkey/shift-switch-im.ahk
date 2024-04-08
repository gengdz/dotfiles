$*Shift:: ; 使用 "$" 符号表示不阻止原Shift键的功能
    cDown := A_TickCount
    KeyWait, Shift, T150 ; 等待150毫秒看是否还有其他键被按下
    if (ErrorLevel = 0) 
        SendInput #{Space} ; 如果150毫秒内没有其他键按下，则发送Win+Space进行输入法切换
        KeyWait, Shift ; 确保Shift键抬起后再继续接收其他按键消息
return
