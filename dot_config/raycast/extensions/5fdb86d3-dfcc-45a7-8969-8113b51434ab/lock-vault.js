"use strict";var hn=Object.create;var F=Object.defineProperty;var gn=Object.getOwnPropertyDescriptor;var En=Object.getOwnPropertyNames;var yn=Object.getPrototypeOf,Tn=Object.prototype.hasOwnProperty;var p=(e,t)=>()=>(t||e((t={exports:{}}).exports,t),t.exports),wn=(e,t)=>{for(var n in t)F(e,n,{get:t[n],enumerable:!0})},Ne=(e,t,n,r)=>{if(t&&typeof t=="object"||typeof t=="function")for(let o of En(t))!Tn.call(e,o)&&o!==n&&F(e,o,{get:()=>t[o],enumerable:!(r=gn(t,o))||r.enumerable});return e};var x=(e,t,n)=>(n=e!=null?hn(yn(e)):{},Ne(t||!e||!e.__esModule?F(n,"default",{value:e,enumerable:!0}):n,e)),xn=e=>Ne(F({},"__esModule",{value:!0}),e);var Ge=p((Fr,Me)=>{Me.exports=ke;ke.sync=Pn;var Ce=require("fs");function In(e,t){var n=t.pathExt!==void 0?t.pathExt:process.env.PATHEXT;if(!n||(n=n.split(";"),n.indexOf("")!==-1))return!0;for(var r=0;r<n.length;r++){var o=n[r].toLowerCase();if(o&&e.substr(-o.length).toLowerCase()===o)return!0}return!1}function Le(e,t,n){return!e.isSymbolicLink()&&!e.isFile()?!1:In(t,n)}function ke(e,t,n){Ce.stat(e,function(r,o){n(r,r?!1:Le(o,e,t))})}function Pn(e,t){return Le(Ce.statSync(e),e,t)}});var Fe=p((Hr,Be)=>{Be.exports=De;De.sync=bn;var Ue=require("fs");function De(e,t,n){Ue.stat(e,function(r,o){n(r,r?!1:Ve(o,t))})}function bn(e,t){return Ve(Ue.statSync(e),t)}function Ve(e,t){return e.isFile()&&On(e,t)}function On(e,t){var n=e.mode,r=e.uid,o=e.gid,s=t.uid!==void 0?t.uid:process.getuid&&process.getuid(),i=t.gid!==void 0?t.gid:process.getgid&&process.getgid(),a=parseInt("100",8),c=parseInt("010",8),l=parseInt("001",8),f=a|c,g=n&l||n&c&&o===i||n&a&&r===s||n&f&&s===0;return g}});var je=p(($r,He)=>{var jr=require("fs"),H;process.platform==="win32"||global.TESTING_WINDOWS?H=Ge():H=Fe();He.exports=te;te.sync=An;function te(e,t,n){if(typeof t=="function"&&(n=t,t={}),!n){if(typeof Promise!="function")throw new TypeError("callback not provided");return new Promise(function(r,o){te(e,t||{},function(s,i){s?o(s):r(i)})})}H(e,t||{},function(r,o){r&&(r.code==="EACCES"||t&&t.ignoreErrors)&&(r=null,o=!1),n(r,o)})}function An(e,t){try{return H.sync(e,t||{})}catch(n){if(t&&t.ignoreErrors||n.code==="EACCES")return!1;throw n}}});var ze=p((Kr,Xe)=>{var _=process.platform==="win32"||process.env.OSTYPE==="cygwin"||process.env.OSTYPE==="msys",$e=require("path"),_n=_?";":":",Ke=je(),Ye=e=>Object.assign(new Error(`not found: ${e}`),{code:"ENOENT"}),We=(e,t)=>{let n=t.colon||_n,r=e.match(/\//)||_&&e.match(/\\/)?[""]:[..._?[process.cwd()]:[],...(t.path||process.env.PATH||"").split(n)],o=_?t.pathExt||process.env.PATHEXT||".EXE;.CMD;.BAT;.COM":"",s=_?o.split(n):[""];return _&&e.indexOf(".")!==-1&&s[0]!==""&&s.unshift(""),{pathEnv:r,pathExt:s,pathExtExe:o}},qe=(e,t,n)=>{typeof t=="function"&&(n=t,t={}),t||(t={});let{pathEnv:r,pathExt:o,pathExtExe:s}=We(e,t),i=[],a=l=>new Promise((f,g)=>{if(l===r.length)return t.all&&i.length?f(i):g(Ye(e));let h=r[l],y=/^".*"$/.test(h)?h.slice(1,-1):h,T=$e.join(y,e),w=!y&&/^\.[\\\/]/.test(e)?e.slice(0,2)+T:T;f(c(w,l,0))}),c=(l,f,g)=>new Promise((h,y)=>{if(g===o.length)return h(a(f+1));let T=o[g];Ke(l+T,{pathExt:s},(w,A)=>{if(!w&&A)if(t.all)i.push(l+T);else return h(l+T);return h(c(l,f,g+1))})});return n?a(0).then(l=>n(null,l),n):a(0)},vn=(e,t)=>{t=t||{};let{pathEnv:n,pathExt:r,pathExtExe:o}=We(e,t),s=[];for(let i=0;i<n.length;i++){let a=n[i],c=/^".*"$/.test(a)?a.slice(1,-1):a,l=$e.join(c,e),f=!c&&/^\.[\\\/]/.test(e)?e.slice(0,2)+l:l;for(let g=0;g<r.length;g++){let h=f+r[g];try{if(Ke.sync(h,{pathExt:o}))if(t.all)s.push(h);else return h}catch{}}}if(t.all&&s.length)return s;if(t.nothrow)return null;throw Ye(e)};Xe.exports=qe;qe.sync=vn});var Je=p((Yr,ne)=>{"use strict";var Qe=(e={})=>{let t=e.env||process.env;return(e.platform||process.platform)!=="win32"?"PATH":Object.keys(t).reverse().find(r=>r.toUpperCase()==="PATH")||"Path"};ne.exports=Qe;ne.exports.default=Qe});var nt=p((Wr,tt)=>{"use strict";var Ze=require("path"),Rn=ze(),Nn=Je();function et(e,t){let n=e.options.env||process.env,r=process.cwd(),o=e.options.cwd!=null,s=o&&process.chdir!==void 0&&!process.chdir.disabled;if(s)try{process.chdir(e.options.cwd)}catch{}let i;try{i=Rn.sync(e.command,{path:n[Nn({env:n})],pathExt:t?Ze.delimiter:void 0})}catch{}finally{s&&process.chdir(r)}return i&&(i=Ze.resolve(o?e.options.cwd:"",i)),i}function Cn(e){return et(e)||et(e,!0)}tt.exports=Cn});var rt=p((qr,oe)=>{"use strict";var re=/([()\][%!^"`<>&|;, *?])/g;function Ln(e){return e=e.replace(re,"^$1"),e}function kn(e,t){return e=`${e}`,e=e.replace(/(\\*)"/g,'$1$1\\"'),e=e.replace(/(\\*)$/,"$1$1"),e=`"${e}"`,e=e.replace(re,"^$1"),t&&(e=e.replace(re,"^$1")),e}oe.exports.command=Ln;oe.exports.argument=kn});var st=p((Xr,ot)=>{"use strict";ot.exports=/^#!(.*)/});var at=p((zr,it)=>{"use strict";var Mn=st();it.exports=(e="")=>{let t=e.match(Mn);if(!t)return null;let[n,r]=t[0].replace(/#! ?/,"").split(" "),o=n.split("/").pop();return o==="env"?r:r?`${o} ${r}`:o}});var ut=p((Qr,ct)=>{"use strict";var se=require("fs"),Gn=at();function Un(e){let n=Buffer.alloc(150),r;try{r=se.openSync(e,"r"),se.readSync(r,n,0,150,0),se.closeSync(r)}catch{}return Gn(n.toString())}ct.exports=Un});var pt=p((Jr,ft)=>{"use strict";var Dn=require("path"),lt=nt(),dt=rt(),Vn=ut(),Bn=process.platform==="win32",Fn=/\.(?:com|exe)$/i,Hn=/node_modules[\\/].bin[\\/][^\\/]+\.cmd$/i;function jn(e){e.file=lt(e);let t=e.file&&Vn(e.file);return t?(e.args.unshift(e.file),e.command=t,lt(e)):e.file}function $n(e){if(!Bn)return e;let t=jn(e),n=!Fn.test(t);if(e.options.forceShell||n){let r=Hn.test(t);e.command=Dn.normalize(e.command),e.command=dt.command(e.command),e.args=e.args.map(s=>dt.argument(s,r));let o=[e.command].concat(e.args).join(" ");e.args=["/d","/s","/c",`"${o}"`],e.command=process.env.comspec||"cmd.exe",e.options.windowsVerbatimArguments=!0}return e}function Kn(e,t,n){t&&!Array.isArray(t)&&(n=t,t=null),t=t?t.slice(0):[],n=Object.assign({},n);let r={command:e,args:t,options:n,file:void 0,original:{command:e,args:t}};return n.shell?r:$n(r)}ft.exports=Kn});var ht=p((Zr,St)=>{"use strict";var ie=process.platform==="win32";function ae(e,t){return Object.assign(new Error(`${t} ${e.command} ENOENT`),{code:"ENOENT",errno:"ENOENT",syscall:`${t} ${e.command}`,path:e.command,spawnargs:e.args})}function Yn(e,t){if(!ie)return;let n=e.emit;e.emit=function(r,o){if(r==="exit"){let s=mt(o,t,"spawn");if(s)return n.call(e,"error",s)}return n.apply(e,arguments)}}function mt(e,t){return ie&&e===1&&!t.file?ae(t.original,"spawn"):null}function Wn(e,t){return ie&&e===1&&!t.file?ae(t.original,"spawnSync"):null}St.exports={hookChildProcess:Yn,verifyENOENT:mt,verifyENOENTSync:Wn,notFoundError:ae}});var yt=p((eo,v)=>{"use strict";var gt=require("child_process"),ce=pt(),ue=ht();function Et(e,t,n){let r=ce(e,t,n),o=gt.spawn(r.command,r.args,r.options);return ue.hookChildProcess(o,r),o}function qn(e,t,n){let r=ce(e,t,n),o=gt.spawnSync(r.command,r.args,r.options);return o.error=o.error||ue.verifyENOENTSync(o.status,r),o}v.exports=Et;v.exports.spawn=Et;v.exports.sync=qn;v.exports._parse=ce;v.exports._enoent=ue});var Ct=p((To,Y)=>{Y.exports=["SIGABRT","SIGALRM","SIGHUP","SIGINT","SIGTERM"];process.platform!=="win32"&&Y.exports.push("SIGVTALRM","SIGXCPU","SIGXFSZ","SIGUSR2","SIGTRAP","SIGSYS","SIGQUIT","SIGIOT");process.platform==="linux"&&Y.exports.push("SIGIO","SIGPOLL","SIGPWR","SIGSTKFLT","SIGUNUSED")});var Ut=p((wo,L)=>{var u=global.process,b=function(e){return e&&typeof e=="object"&&typeof e.removeListener=="function"&&typeof e.emit=="function"&&typeof e.reallyExit=="function"&&typeof e.listeners=="function"&&typeof e.kill=="function"&&typeof e.pid=="number"&&typeof e.on=="function"};b(u)?(Lt=require("assert"),N=Ct(),kt=/^win/i.test(u.platform),M=require("events"),typeof M!="function"&&(M=M.EventEmitter),u.__signal_exit_emitter__?m=u.__signal_exit_emitter__:(m=u.__signal_exit_emitter__=new M,m.count=0,m.emitted={}),m.infinite||(m.setMaxListeners(1/0),m.infinite=!0),L.exports=function(e,t){if(!b(global.process))return function(){};Lt.equal(typeof e,"function","a callback must be provided for exit handler"),C===!1&&me();var n="exit";t&&t.alwaysLast&&(n="afterexit");var r=function(){m.removeListener(n,e),m.listeners("exit").length===0&&m.listeners("afterexit").length===0&&W()};return m.on(n,e),r},W=function(){!C||!b(global.process)||(C=!1,N.forEach(function(t){try{u.removeListener(t,q[t])}catch{}}),u.emit=X,u.reallyExit=Se,m.count-=1)},L.exports.unload=W,O=function(t,n,r){m.emitted[t]||(m.emitted[t]=!0,m.emit(t,n,r))},q={},N.forEach(function(e){q[e]=function(){if(b(global.process)){var n=u.listeners(e);n.length===m.count&&(W(),O("exit",null,e),O("afterexit",null,e),kt&&e==="SIGHUP"&&(e="SIGINT"),u.kill(u.pid,e))}}}),L.exports.signals=function(){return N},C=!1,me=function(){C||!b(global.process)||(C=!0,m.count+=1,N=N.filter(function(t){try{return u.on(t,q[t]),!0}catch{return!1}}),u.emit=Gt,u.reallyExit=Mt)},L.exports.load=me,Se=u.reallyExit,Mt=function(t){b(global.process)&&(u.exitCode=t||0,O("exit",u.exitCode,null),O("afterexit",u.exitCode,null),Se.call(u,u.exitCode))},X=u.emit,Gt=function(t,n){if(t==="exit"&&b(global.process)){n!==void 0&&(u.exitCode=n);var r=X.apply(this,arguments);return O("exit",u.exitCode,null),O("afterexit",u.exitCode,null),r}else return X.apply(this,arguments)}):L.exports=function(){return function(){}};var Lt,N,kt,M,m,W,O,q,C,me,Se,Mt,X,Gt});var Wt=p((Po,Yt)=>{"use strict";var{PassThrough:Er}=require("stream");Yt.exports=e=>{e={...e};let{array:t}=e,{encoding:n}=e,r=n==="buffer",o=!1;t?o=!(n||r):n=n||"utf8",r&&(n=null);let s=new Er({objectMode:o});n&&s.setEncoding(n);let i=0,a=[];return s.on("data",c=>{a.push(c),o?i=a.length:i+=c.length}),s.getBufferedValue=()=>t?a:r?Buffer.concat(a,i):a.join(""),s.getBufferedLength=()=>i,s}});var qt=p((bo,G)=>{"use strict";var{constants:yr}=require("buffer"),Tr=require("stream"),{promisify:wr}=require("util"),xr=Wt(),Ir=wr(Tr.pipeline),z=class extends Error{constructor(){super("maxBuffer exceeded"),this.name="MaxBufferError"}};async function he(e,t){if(!e)throw new Error("Expected a stream");t={maxBuffer:1/0,...t};let{maxBuffer:n}=t,r=xr(t);return await new Promise((o,s)=>{let i=a=>{a&&r.getBufferedLength()<=yr.MAX_LENGTH&&(a.bufferedData=r.getBufferedValue()),s(a)};(async()=>{try{await Ir(e,r),o()}catch(a){i(a)}})(),r.on("data",()=>{r.getBufferedLength()>n&&i(new z)})}),r.getBufferedValue()}G.exports=he;G.exports.buffer=(e,t)=>he(e,{...t,encoding:"buffer"});G.exports.array=(e,t)=>he(e,{...t,array:!0});G.exports.MaxBufferError=z});var zt=p((Oo,Xt)=>{"use strict";var{PassThrough:Pr}=require("stream");Xt.exports=function(){var e=[],t=new Pr({objectMode:!0});return t.setMaxListeners(0),t.add=n,t.isEmpty=r,t.on("unpipe",o),Array.prototype.slice.call(arguments).forEach(n),t;function n(s){return Array.isArray(s)?(s.forEach(n),this):(e.push(s),s.once("end",o.bind(null,s)),s.once("error",t.emit.bind(t,"error")),s.pipe(t,{end:!1}),this)}function r(){return e.length==0}function o(s){e=e.filter(function(i){return i!==s}),!e.length&&t.readable&&t.end()}}});var Vr={};wn(Vr,{default:()=>Dr});module.exports=xn(Vr);var P=require("@raycast/api");var S=require("@raycast/api");var sn=require("node:buffer"),an=x(require("node:path"),1),xe=x(require("node:child_process"),1),U=x(require("node:process"),1),cn=x(yt(),1);function le(e){let t=typeof e=="string"?`
`:`
`.charCodeAt(),n=typeof e=="string"?"\r":"\r".charCodeAt();return e[e.length-1]===t&&(e=e.slice(0,-1)),e[e.length-1]===n&&(e=e.slice(0,-1)),e}var k=x(require("node:process"),1),R=x(require("node:path"),1),Tt=x(require("node:url"),1);function j(e={}){let{env:t=process.env,platform:n=process.platform}=e;return n!=="win32"?"PATH":Object.keys(t).reverse().find(r=>r.toUpperCase()==="PATH")||"Path"}function Xn(e={}){let{cwd:t=k.default.cwd(),path:n=k.default.env[j()],execPath:r=k.default.execPath}=e,o,s=t instanceof URL?Tt.default.fileURLToPath(t):t,i=R.default.resolve(s),a=[];for(;o!==i;)a.push(R.default.join(i,"node_modules/.bin")),o=i,i=R.default.resolve(i,"..");return a.push(R.default.resolve(s,r,"..")),[...a,n].join(R.default.delimiter)}function wt({env:e=k.default.env,...t}={}){e={...e};let n=j({env:e});return t.path=e[n],e[n]=Xn(t),e}var zn=(e,t,n,r)=>{if(n==="length"||n==="prototype"||n==="arguments"||n==="caller")return;let o=Object.getOwnPropertyDescriptor(e,n),s=Object.getOwnPropertyDescriptor(t,n);!Qn(o,s)&&r||Object.defineProperty(e,n,s)},Qn=function(e,t){return e===void 0||e.configurable||e.writable===t.writable&&e.enumerable===t.enumerable&&e.configurable===t.configurable&&(e.writable||e.value===t.value)},Jn=(e,t)=>{let n=Object.getPrototypeOf(t);n!==Object.getPrototypeOf(e)&&Object.setPrototypeOf(e,n)},Zn=(e,t)=>`/* Wrapped ${e}*/
${t}`,er=Object.getOwnPropertyDescriptor(Function.prototype,"toString"),tr=Object.getOwnPropertyDescriptor(Function.prototype.toString,"name"),nr=(e,t,n)=>{let r=n===""?"":`with ${n.trim()}() `,o=Zn.bind(null,r,t.toString());Object.defineProperty(o,"name",tr),Object.defineProperty(e,"toString",{...er,value:o})};function de(e,t,{ignoreNonConfigurable:n=!1}={}){let{name:r}=e;for(let o of Reflect.ownKeys(t))zn(e,t,o,n);return Jn(e,t),nr(e,t,r),e}var $=new WeakMap,xt=(e,t={})=>{if(typeof e!="function")throw new TypeError("Expected a function");let n,r=0,o=e.displayName||e.name||"<anonymous>",s=function(...i){if($.set(s,++r),r===1)n=e.apply(this,i),e=null;else if(t.throw===!0)throw new Error(`Function \`${o}\` can only be called once`);return n};return de(s,e),$.set(s,r),s};xt.callCount=e=>{if(!$.has(e))throw new Error(`The given function \`${e.name}\` is not wrapped by the \`onetime\` package`);return $.get(e)};var It=xt;var vt=require("node:os");var Pt=function(){let e=Ot-bt+1;return Array.from({length:e},rr)},rr=function(e,t){return{name:`SIGRT${t+1}`,number:bt+t,action:"terminate",description:"Application-specific signal (realtime)",standard:"posix"}},bt=34,Ot=64;var _t=require("node:os");var At=[{name:"SIGHUP",number:1,action:"terminate",description:"Terminal closed",standard:"posix"},{name:"SIGINT",number:2,action:"terminate",description:"User interruption with CTRL-C",standard:"ansi"},{name:"SIGQUIT",number:3,action:"core",description:"User interruption with CTRL-\\",standard:"posix"},{name:"SIGILL",number:4,action:"core",description:"Invalid machine instruction",standard:"ansi"},{name:"SIGTRAP",number:5,action:"core",description:"Debugger breakpoint",standard:"posix"},{name:"SIGABRT",number:6,action:"core",description:"Aborted",standard:"ansi"},{name:"SIGIOT",number:6,action:"core",description:"Aborted",standard:"bsd"},{name:"SIGBUS",number:7,action:"core",description:"Bus error due to misaligned, non-existing address or paging error",standard:"bsd"},{name:"SIGEMT",number:7,action:"terminate",description:"Command should be emulated but is not implemented",standard:"other"},{name:"SIGFPE",number:8,action:"core",description:"Floating point arithmetic error",standard:"ansi"},{name:"SIGKILL",number:9,action:"terminate",description:"Forced termination",standard:"posix",forced:!0},{name:"SIGUSR1",number:10,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGSEGV",number:11,action:"core",description:"Segmentation fault",standard:"ansi"},{name:"SIGUSR2",number:12,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGPIPE",number:13,action:"terminate",description:"Broken pipe or socket",standard:"posix"},{name:"SIGALRM",number:14,action:"terminate",description:"Timeout or timer",standard:"posix"},{name:"SIGTERM",number:15,action:"terminate",description:"Termination",standard:"ansi"},{name:"SIGSTKFLT",number:16,action:"terminate",description:"Stack is empty or overflowed",standard:"other"},{name:"SIGCHLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"posix"},{name:"SIGCLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"other"},{name:"SIGCONT",number:18,action:"unpause",description:"Unpaused",standard:"posix",forced:!0},{name:"SIGSTOP",number:19,action:"pause",description:"Paused",standard:"posix",forced:!0},{name:"SIGTSTP",number:20,action:"pause",description:'Paused using CTRL-Z or "suspend"',standard:"posix"},{name:"SIGTTIN",number:21,action:"pause",description:"Background process cannot read terminal input",standard:"posix"},{name:"SIGBREAK",number:21,action:"terminate",description:"User interruption with CTRL-BREAK",standard:"other"},{name:"SIGTTOU",number:22,action:"pause",description:"Background process cannot write to terminal output",standard:"posix"},{name:"SIGURG",number:23,action:"ignore",description:"Socket received out-of-band data",standard:"bsd"},{name:"SIGXCPU",number:24,action:"core",description:"Process timed out",standard:"bsd"},{name:"SIGXFSZ",number:25,action:"core",description:"File too big",standard:"bsd"},{name:"SIGVTALRM",number:26,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGPROF",number:27,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGWINCH",number:28,action:"ignore",description:"Terminal window size changed",standard:"bsd"},{name:"SIGIO",number:29,action:"terminate",description:"I/O is available",standard:"other"},{name:"SIGPOLL",number:29,action:"terminate",description:"Watched event",standard:"other"},{name:"SIGINFO",number:29,action:"ignore",description:"Request for process information",standard:"other"},{name:"SIGPWR",number:30,action:"terminate",description:"Device running out of power",standard:"systemv"},{name:"SIGSYS",number:31,action:"core",description:"Invalid system call",standard:"other"},{name:"SIGUNUSED",number:31,action:"terminate",description:"Invalid system call",standard:"other"}];var fe=function(){let e=Pt();return[...At,...e].map(or)},or=function({name:e,number:t,description:n,action:r,forced:o=!1,standard:s}){let{signals:{[e]:i}}=_t.constants,a=i!==void 0;return{name:e,number:a?i:t,description:n,supported:a,action:r,forced:o,standard:s}};var sr=function(){let e=fe();return Object.fromEntries(e.map(ir))},ir=function({name:e,number:t,description:n,supported:r,action:o,forced:s,standard:i}){return[e,{name:e,number:t,description:n,supported:r,action:o,forced:s,standard:i}]},Rt=sr(),ar=function(){let e=fe(),t=64+1,n=Array.from({length:t},(r,o)=>cr(o,e));return Object.assign({},...n)},cr=function(e,t){let n=ur(e,t);if(n===void 0)return{};let{name:r,description:o,supported:s,action:i,forced:a,standard:c}=n;return{[e]:{name:r,number:e,description:o,supported:s,action:i,forced:a,standard:c}}},ur=function(e,t){let n=t.find(({name:r})=>vt.constants.signals[r]===e);return n!==void 0?n:t.find(r=>r.number===e)},So=ar();var lr=({timedOut:e,timeout:t,errorCode:n,signal:r,signalDescription:o,exitCode:s,isCanceled:i})=>e?`timed out after ${t} milliseconds`:i?"was canceled":n!==void 0?`failed with ${n}`:r!==void 0?`was killed with ${r} (${o})`:s!==void 0?`failed with exit code ${s}`:"failed",pe=({stdout:e,stderr:t,all:n,error:r,signal:o,exitCode:s,command:i,escapedCommand:a,timedOut:c,isCanceled:l,killed:f,parsed:{options:{timeout:g}}})=>{s=s===null?void 0:s,o=o===null?void 0:o;let h=o===void 0?void 0:Rt[o].description,y=r&&r.code,w=`Command ${lr({timedOut:c,timeout:g,errorCode:y,signal:o,signalDescription:h,exitCode:s,isCanceled:l})}: ${i}`,A=Object.prototype.toString.call(r)==="[object Error]",V=A?`${w}
${r.message}`:w,B=[V,t,e].filter(Boolean).join(`
`);return A?(r.originalMessage=r.message,r.message=B):r=new Error(B),r.shortMessage=V,r.command=i,r.escapedCommand=a,r.exitCode=s,r.signal=o,r.signalDescription=h,r.stdout=e,r.stderr=t,n!==void 0&&(r.all=n),"bufferedData"in r&&delete r.bufferedData,r.failed=!0,r.timedOut=!!c,r.isCanceled=l,r.killed=f&&!c,r};var K=["stdin","stdout","stderr"],dr=e=>K.some(t=>e[t]!==void 0),Nt=e=>{if(!e)return;let{stdio:t}=e;if(t===void 0)return K.map(r=>e[r]);if(dr(e))throw new Error(`It's not possible to provide \`stdio\` in combination with one of ${K.map(r=>`\`${r}\``).join(", ")}`);if(typeof t=="string")return t;if(!Array.isArray(t))throw new TypeError(`Expected \`stdio\` to be of type \`string\` or \`Array\`, got \`${typeof t}\``);let n=Math.max(t.length,K.length);return Array.from({length:n},(r,o)=>t[o])};var Dt=x(require("node:os"),1),Vt=x(Ut(),1),fr=1e3*5,Bt=(e,t="SIGTERM",n={})=>{let r=e(t);return pr(e,t,n,r),r},pr=(e,t,n,r)=>{if(!mr(t,n,r))return;let o=hr(n),s=setTimeout(()=>{e("SIGKILL")},o);s.unref&&s.unref()},mr=(e,{forceKillAfterTimeout:t},n)=>Sr(e)&&t!==!1&&n,Sr=e=>e===Dt.default.constants.signals.SIGTERM||typeof e=="string"&&e.toUpperCase()==="SIGTERM",hr=({forceKillAfterTimeout:e=!0})=>{if(e===!0)return fr;if(!Number.isFinite(e)||e<0)throw new TypeError(`Expected the \`forceKillAfterTimeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`);return e},Ft=(e,t)=>{e.kill()&&(t.isCanceled=!0)},gr=(e,t,n)=>{e.kill(t),n(Object.assign(new Error("Timed out"),{timedOut:!0,signal:t}))},Ht=(e,{timeout:t,killSignal:n="SIGTERM"},r)=>{if(t===0||t===void 0)return r;let o,s=new Promise((a,c)=>{o=setTimeout(()=>{gr(e,n,c)},t)}),i=r.finally(()=>{clearTimeout(o)});return Promise.race([s,i])},jt=({timeout:e})=>{if(e!==void 0&&(!Number.isFinite(e)||e<0))throw new TypeError(`Expected the \`timeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`)},$t=async(e,{cleanup:t,detached:n},r)=>{if(!t||n)return r;let o=(0,Vt.default)(()=>{e.kill()});return r.finally(()=>{o()})};function Kt(e){return e!==null&&typeof e=="object"&&typeof e.pipe=="function"}var ye=x(qt(),1),Qt=x(zt(),1),Jt=(e,t)=>{t!==void 0&&(Kt(t)?t.pipe(e.stdin):e.stdin.end(t))},Zt=(e,{all:t})=>{if(!t||!e.stdout&&!e.stderr)return;let n=(0,Qt.default)();return e.stdout&&n.add(e.stdout),e.stderr&&n.add(e.stderr),n},ge=async(e,t)=>{if(!(!e||t===void 0)){e.destroy();try{return await t}catch(n){return n.bufferedData}}},Ee=(e,{encoding:t,buffer:n,maxBuffer:r})=>{if(!(!e||!n))return t?(0,ye.default)(e,{encoding:t,maxBuffer:r}):ye.default.buffer(e,{maxBuffer:r})},en=async({stdout:e,stderr:t,all:n},{encoding:r,buffer:o,maxBuffer:s},i)=>{let a=Ee(e,{encoding:r,buffer:o,maxBuffer:s}),c=Ee(t,{encoding:r,buffer:o,maxBuffer:s}),l=Ee(n,{encoding:r,buffer:o,maxBuffer:s*2});try{return await Promise.all([i,a,c,l])}catch(f){return Promise.all([{error:f,signal:f.signal,timedOut:f.timedOut},ge(e,a),ge(t,c),ge(n,l)])}};var br=(async()=>{})().constructor.prototype,Or=["then","catch","finally"].map(e=>[e,Reflect.getOwnPropertyDescriptor(br,e)]),Te=(e,t)=>{for(let[n,r]of Or){let o=typeof t=="function"?(...s)=>Reflect.apply(r.value,t(),s):r.value.bind(t);Reflect.defineProperty(e,n,{...r,value:o})}return e},tn=e=>new Promise((t,n)=>{e.on("exit",(r,o)=>{t({exitCode:r,signal:o})}),e.on("error",r=>{n(r)}),e.stdin&&e.stdin.on("error",r=>{n(r)})});var nn=(e,t=[])=>Array.isArray(t)?[e,...t]:[e],Ar=/^[\w.-]+$/,_r=/"/g,vr=e=>typeof e!="string"||Ar.test(e)?e:`"${e.replace(_r,'\\"')}"`,rn=(e,t)=>nn(e,t).join(" "),on=(e,t)=>nn(e,t).map(n=>vr(n)).join(" ");var Rr=1e3*1e3*100,Nr=({env:e,extendEnv:t,preferLocal:n,localDir:r,execPath:o})=>{let s=t?{...U.default.env,...e}:e;return n?wt({env:s,cwd:r,execPath:o}):s},Cr=(e,t,n={})=>{let r=cn.default._parse(e,t,n);return e=r.command,t=r.args,n=r.options,n={maxBuffer:Rr,buffer:!0,stripFinalNewline:!0,extendEnv:!0,preferLocal:!1,localDir:n.cwd||U.default.cwd(),execPath:U.default.execPath,encoding:"utf8",reject:!0,cleanup:!0,all:!1,windowsHide:!0,...n},n.env=Nr(n),n.stdio=Nt(n),U.default.platform==="win32"&&an.default.basename(e,".exe")==="cmd"&&t.unshift("/q"),{file:e,args:t,options:n,parsed:r}},we=(e,t,n)=>typeof t!="string"&&!sn.Buffer.isBuffer(t)?n===void 0?void 0:"":e.stripFinalNewline?le(t):t;function un(e,t,n){let r=Cr(e,t,n),o=rn(e,t),s=on(e,t);jt(r.options);let i;try{i=xe.default.spawn(r.file,r.args,r.options)}catch(y){let T=new xe.default.ChildProcess,w=Promise.reject(pe({error:y,stdout:"",stderr:"",all:"",command:o,escapedCommand:s,parsed:r,timedOut:!1,isCanceled:!1,killed:!1}));return Te(T,w)}let a=tn(i),c=Ht(i,r.options,a),l=$t(i,r.options,c),f={isCanceled:!1};i.kill=Bt.bind(null,i.kill.bind(i)),i.cancel=Ft.bind(null,i,f);let h=It(async()=>{let[{error:y,exitCode:T,signal:w,timedOut:A},V,B,Sn]=await en(i,r.options,l),Ae=we(r.options,V),_e=we(r.options,B),ve=we(r.options,Sn);if(y||T!==0||w!==null){let Re=pe({error:y,exitCode:T,signal:w,stdout:Ae,stderr:_e,all:ve,command:o,escapedCommand:s,parsed:r,timedOut:A,isCanceled:f.isCanceled||(r.options.signal?r.options.signal.aborted:!1),killed:i.killed});if(!r.options.reject)return Re;throw Re}return{command:o,escapedCommand:s,exitCode:0,stdout:Ae,stderr:_e,all:ve,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}});return Jt(i,r.options.input),i.all=Zt(i,r.options),Te(i,h)}var pn=require("fs"),mn=require("path/posix");var D=require("@raycast/api");var ln="https://bitwarden.com";var d={PASSWORD_OPTIONS:"bw-generate-password-options",PASSWORD_ONE_TIME_WARNING:"bw-generate-password-warning-accepted",SESSION_TOKEN:"sessionToken",REPROMPT_HASH:"sessionRepromptHash",SERVER_URL:"cliServer",LAST_ACTIVITY_TIME:"lastActivityTime",VAULT_LOCK_REASON:"vaultLockReason"},Ie={TIMEOUT:"Vault timed out due to inactivity",MANUAL:"Manually locked by the user"};var Wo={[1]:D.Icon.Globe,[3]:D.Icon.CreditCard,[4]:D.Icon.Person,[2]:D.Icon.Document};var kr=require("@raycast/api");function dn(e){return Object.entries(e).flatMap(([t,n])=>n?[`--${t}`,n]:[])}var Pe=require("@raycast/api");var Mr={IMMEDIATELY:"0",ONE_MINUTE:"60000",FIVE_MINUTES:"300000",FIFTEEN_MINUTES:"900000",THIRTY_MINUTES:"1800000",ONE_HOUR:"3600000",FOUR_HOURS:"14400000",EIGHT_HOURS:"28800000",ONE_DAY:"86400000",NEVER:"-1"},I=Object.entries(Mr).reduce((e,[t,n])=>(e[t]=parseInt(n),e),{});var Gr={[I.IMMEDIATELY]:"Immediately",[I.ONE_MINUTE]:"1 Minute",[I.FIVE_MINUTES]:"5 Minutes",[I.FIFTEEN_MINUTES]:"15 Minutes",[I.THIRTY_MINUTES]:"30 Minutes",[I.ONE_HOUR]:"1 Hour",[I.FOUR_HOURS]:"4 Hours",[I.EIGHT_HOURS]:"8 Hours",[I.ONE_DAY]:"1 Day"};var is={[1]:"Login",[3]:"Card",[4]:"Identity",[2]:"Secure Note"};function fn(){let{serverUrl:e}=(0,Pe.getPreferenceValues)();return e===""||e==="bitwarden.com"||e==="https://bitwarden.com"?"":e}var be=class extends Error{constructor(t){super(t)}},Q=class extends be{constructor(t){super(t)}},J=class extends Q{constructor(t){super(t??"Bitwarden CLI not found"),this.name="CLINotFoundError"}};var Z=class extends Q{constructor(t){super(t??"Vault is locked"),this.name="VaultIsLockedError"}};var ee=class{constructor(){this.callbacks={};let{cliPath:t,clientId:n,clientSecret:r,serverCertsPath:o}=(0,S.getPreferenceValues)(),s=fn();if(this.cliPath=t||(process.arch=="arm64"?"/opt/homebrew/bin/bw":"/usr/local/bin/bw"),!(0,pn.existsSync)(this.cliPath))throw new J(`Bitwarden CLI not found at ${this.cliPath}`);this.env={BITWARDENCLI_APPDATA_DIR:S.environment.supportPath,BW_CLIENTSECRET:r.trim(),BW_CLIENTID:n.trim(),PATH:(0,mn.dirname)(process.execPath),...s&&o?{NODE_EXTRA_CA_CERTS:o}:{}},this.initPromise=(async()=>{await this.checkServerUrl(s),this.lockReason=await S.LocalStorage.getItem(d.VAULT_LOCK_REASON)})()}setActionCallback(t,n){return this.callbacks[t]=n,this}setSessionToken(t){this.env={...this.env,BW_SESSION:t}}clearSessionToken(){delete this.env.BW_SESSION}withSession(t){return this.tempSessionToken=t,this}async initialize(){return await this.initPromise,this}async checkServerUrl(t){if((await S.LocalStorage.getItem(d.SERVER_URL)||"")===t)return;let r=await(0,S.showToast)({style:S.Toast.Style.Animated,title:"Switching server...",message:"Bitwarden server preference changed"});try{try{await this.logout()}catch{}await this.exec(["config","server",t||ln]),await S.LocalStorage.setItem(d.SERVER_URL,t),r.style=S.Toast.Style.Success,r.title="Success",r.message="Bitwarden server changed"}catch(o){r.style=S.Toast.Style.Failure,r.title="Failed to switch server",o instanceof Error?r.message=o.message:r.message="Unknown error occurred"}}async setLockReason(t){this.lockReason=t,await S.LocalStorage.setItem(d.VAULT_LOCK_REASON,t)}async clearLockReason(){this.lockReason&&(await S.LocalStorage.removeItem(d.VAULT_LOCK_REASON),this.lockReason=void 0)}async exec(t,n){let{abortController:r,input:o="",skipLastActivityUpdate:s=!1}=n??{},i=this.env;this.tempSessionToken&&(i={...i,BW_SESSION:this.tempSessionToken});let a=await un(this.cliPath,t,{env:i,input:o,signal:r?.signal});if(s||await S.LocalStorage.setItem(d.LAST_ACTIVITY_TIME,new Date().toISOString()),this.tempSessionToken&&(this.tempSessionToken=void 0),this.isPromptWaitingForMasterPassword(a))throw await this.lock(),new Z;return a}async sync(){await this.exec(["sync"])}async login(){await this.exec(["login","--apikey"]),await this.clearLockReason(),await this.callbacks.login?.()}async logout(){await this.exec(["logout"]),this.clearSessionToken(),await this.callbacks.logout?.()}async lock(t,n){n&&!((await this.status()).status!=="unauthenticated")||(t&&await this.setLockReason(t),await this.exec(["lock"]),await this.callbacks.lock?.(t))}async unlock(t){let{stdout:n}=await this.exec(["unlock",t,"--raw"]);return this.setSessionToken(n),await this.clearLockReason(),await this.callbacks.unlock?.(t,n),n}async listItems(){let{stdout:t}=await this.exec(["list","items"]);return JSON.parse(t).filter(r=>!!r.name)}async listFolders(){let{stdout:t}=await this.exec(["list","folders"]);return JSON.parse(t)}async getTotp(t){let{stdout:n}=await this.exec(["get","totp",t]);return n}async status(){let{stdout:t}=await this.exec(["status"]);return JSON.parse(t)}async checkLockStatus(){try{return await this.exec(["unlock","--check"]),"unlocked"}catch(t){return t.stderr==="Vault is locked."?"locked":"unauthenticated"}}async generatePassword(t,n){let r=t?dn(t):[],{stdout:o}=await this.exec(["generate",...r],{abortController:n});return o}isPromptWaitingForMasterPassword(t){return!!(t.stderr&&t.stderr.includes("Master password"))}};var E=require("@raycast/api");var Oe={getSavedSession:()=>Promise.all([E.LocalStorage.getItem(d.SESSION_TOKEN),E.LocalStorage.getItem(d.REPROMPT_HASH),E.LocalStorage.getItem(d.LAST_ACTIVITY_TIME)]),clearSession:async()=>{await Promise.all([E.LocalStorage.removeItem(d.SESSION_TOKEN),E.LocalStorage.removeItem(d.REPROMPT_HASH)])},saveSession:async(e,t)=>{await Promise.all([E.LocalStorage.setItem(d.SESSION_TOKEN,e),E.LocalStorage.setItem(d.REPROMPT_HASH,t)])},logoutClearSession:async()=>{await Promise.all([E.LocalStorage.removeItem(d.SESSION_TOKEN),E.LocalStorage.removeItem(d.REPROMPT_HASH),E.LocalStorage.removeItem(d.LAST_ACTIVITY_TIME),E.LocalStorage.removeItem(d.VAULT_LOCK_REASON)])}};async function Ur(){try{await(0,P.showToast)(P.Toast.Style.Animated,"Locking vault...","Please wait");let[e]=await Oe.getSavedSession();if(!e){await(0,P.showToast)(P.Toast.Style.Failure,"No session found","Already locked or not logged in");return}await(await new ee().initialize()).withSession(e).lock(Ie.MANUAL),await Oe.clearSession(),await(0,P.showToast)(P.Toast.Style.Success,"Vault successfully locked")}catch{await(0,P.showToast)(P.Toast.Style.Failure,"Failed to lock vault")}}var Dr=Ur;