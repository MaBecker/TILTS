
- download from https://ollama.com/download and install
- add a simple /Library/LaunchDaemons/com.ollama.server.plist
```bash
sudo  vi /Library/LaunchDaemons/com.ollama.server.plist
```
   * copy and past this simple file and replace your_user_name
```xml
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
	    <key>Label</key>
	    <string>com.ollama.ollama</string>
	
	    <key>UserName</key>
	    <string>your_user_name</string>
	
	    <key>EnvironmentVariables</key>
	    <dict>
	           <key>OLLAMA_HOST</key>
	           <string>0.0.0.0:11434</string>
	    </dict>
	
	    <key>ProgramArguments</key>
	    <array>
	        <string>/usr/local/bin/ollama</string>
	        <string>serve</string>
	    </array>
	
	    <key>RunAtLoad</key>
	    <true/>
	
	    <key>KeepAlive</key>
	    <true/>
	
	    <key>ProcessType</key>
	    <string>Interactive</string>
	</dict>
	</plist>
```
* set default user and group
```bash
sudo chown root:wheel /Library/LaunchDaemons/com.ollama.server.plist
```

  * check for possible additional EnvironmentVariables and their defaults
```bash
ollama serve --help
Start Ollama

Usage:
  ollama serve [flags]

Aliases:
  serve, start

Flags:
  -h, --help   help for serve

Environment Variables:
      OLLAMA_DEBUG               Show additional debug information (e.g. OLLAMA_DEBUG=1)
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)
      OLLAMA_CONTEXT_LENGTH      Context length to use unless otherwise specified (default: 4k/32k/256k based on VRAM)
      OLLAMA_KEEP_ALIVE          The duration that models stay loaded in memory (default "5m")
      OLLAMA_MAX_LOADED_MODELS   Maximum number of loaded models per GPU
      OLLAMA_MAX_QUEUE           Maximum number of queued requests
      OLLAMA_MODELS              The path to the models directory
      OLLAMA_NUM_PARALLEL        Maximum number of parallel requests
      OLLAMA_NOPRUNE             Do not prune model blobs on startup
      OLLAMA_ORIGINS             A comma separated list of allowed origins
      OLLAMA_SCHED_SPREAD        Always schedule model across all GPUs
      OLLAMA_FLASH_ATTENTION     Enabled flash attention
      OLLAMA_KV_CACHE_TYPE       Quantization type for the K/V cache (default: f16)
      OLLAMA_LLM_LIBRARY         Set LLM library to bypass autodetection
      OLLAMA_GPU_OVERHEAD        Reserve a portion of VRAM per GPU (bytes)
      OLLAMA_LOAD_TIMEOUT        How long to allow model loads to stall before giving up (default "5m")

```
-  reboot and check from a different system if remote access works
```bash
curl -w '\n' your_host_name_or_ip:11434
Ollama is running
```