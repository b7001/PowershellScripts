Start-Job -Name 'th0' -ScriptBlock {
  for($i = 0; $i -lt 500; $i++)
  {
      echo "Thread 0: $i"
      Start-Sleep 1
  }
}

Start-Job -Name 'th1' -ScriptBlock {
  for($i = 0; $i -lt 500; $i++)
  {
      echo "Thread 1: $i"
      Start-Sleep 1
  }
}

While (Get-Job -State "Running"){

    #output is buffered for Jobs
    #use below to get output

    Receive-Job 'th0';
    Receive-Job 'th1'

    Start-Sleep 1;

}
