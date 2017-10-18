Here I list some simple DApps written by me.

## Sleepy
Simple bedtime calculator on top of Ethereum blockchain.

It can:
   * Tell you when you should wake up considering given time of going to bed
   * Tell you when you should go to bed considering given time of waking up
   
The idea and the algorithm of the contract was taken from <a href="http://sleepyti.me">SleepyTime</a>.

## iChing
Generates 6 lines that then cast to an I Ching hexagram. More on Wikipedia: <a href="https://en.wikipedia.org/wiki/I_Ching">I Ching</a>.

I wrote these contracts for <a href="https://github.com/0xb100d">this</a> nice guy who maintains <a href="https://github.com/0xb100d/eChing">this</a> repo. Also he mantains a website where you can try it out. For more information visit his original <a href="https://github.com/0xb100d/eChing">repository</a>.

Actually the contracts just generate 6 pseudo random numbers considering block number, input string, address and line height.

There are two versions of the contract, one of them uses Oraclize and takes a random number from <a href="https://www.wolframalpha.com/">WolframAlpha</a> and then uses it as a seed. The other one just do ```uint(keccak256(block.number, msg.sender, _question, _lineHeight))```.
