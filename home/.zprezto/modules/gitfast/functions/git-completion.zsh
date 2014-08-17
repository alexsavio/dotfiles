<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'>
<head>
<title>git.git - The core git plumbing</title>
<meta name='generator' content='cgit v0.10.1'/>
<meta name='robots' content='index, nofollow'/>
<link rel='stylesheet' type='text/css' href='/cgit-korg-0.10.1.css'/>
<link rel='shortcut icon' href='/favicon.png'/>
<link rel='alternate' title='Atom feed' href='http://git.kernel.org/cgit/git/git.git/atom/contrib/completion/git-completion.zsh?h=master' type='application/atom+xml'/>
</head>
<body>
<div id='cgit'><table id='header'>
<tr>
<td class='logo' rowspan='2'><a href='/cgit/'><img src='/tux-cgit.png' alt='cgit logo'/></a></td>
<td class='main'><a href='/cgit/'>index</a> : <a title='git.git' href='/cgit/git/git.git/'>git.git</a></td><td class='form'><form method='get' action=''>
<select name='h' onchange='this.form.submit();'>
<option value='maint'>maint</option>
<option value='master' selected='selected'>master</option>
<option value='next'>next</option>
<option value='pu'>pu</option>
<option value='todo'>todo</option>
</select> <input type='submit' name='' value='switch'/></form></td></tr>
<tr><td class='sub'>The core git plumbing</td><td class='sub right'>Junio C. Hamano</td></tr></table>
<table class='tabs'><tr><td>
<a href='/cgit/git/git.git/'>summary</a><a href='/cgit/git/git.git/refs/'>refs</a><a href='/cgit/git/git.git/log/contrib/completion/git-completion.zsh'>log</a><a class='active' href='/cgit/git/git.git/tree/contrib/completion/git-completion.zsh'>tree</a><a href='/cgit/git/git.git/commit/contrib/completion/git-completion.zsh'>commit</a><a href='/cgit/git/git.git/diff/contrib/completion/git-completion.zsh'>diff</a><a href='/cgit/git/git.git/stats/contrib/completion/git-completion.zsh'>stats</a></td><td class='form'><form class='right' method='get' action='/cgit/git/git.git/log/contrib/completion/git-completion.zsh'>
<select name='qt'>
<option value='grep'>log msg</option>
<option value='author'>author</option>
<option value='committer'>committer</option>
<option value='range'>range</option>
</select>
<input class='txt' type='text' size='10' name='q' value=''/>
<input type='submit' value='search'/>
</form>
</td></tr></table>
<div class='path'>path: <a href='/cgit/git/git.git/tree/'>root</a>/<a href='/cgit/git/git.git/tree/contrib'>contrib</a>/<a href='/cgit/git/git.git/tree/contrib/completion'>completion</a>/<a href='/cgit/git/git.git/tree/contrib/completion/git-completion.zsh'>git-completion.zsh</a></div><div class='content'>blob: 9f6f0fa5581002a2371e062fd5def0978733edc1 (<a href='/cgit/git/git.git/plain/contrib/completion/git-completion.zsh'>plain</a>)
<table summary='blob content' class='blob'>
<tr><td class='linenumbers'><pre><a id='n1' href='#n1'>1</a>
<a id='n2' href='#n2'>2</a>
<a id='n3' href='#n3'>3</a>
<a id='n4' href='#n4'>4</a>
<a id='n5' href='#n5'>5</a>
<a id='n6' href='#n6'>6</a>
<a id='n7' href='#n7'>7</a>
<a id='n8' href='#n8'>8</a>
<a id='n9' href='#n9'>9</a>
<a id='n10' href='#n10'>10</a>
<a id='n11' href='#n11'>11</a>
<a id='n12' href='#n12'>12</a>
<a id='n13' href='#n13'>13</a>
<a id='n14' href='#n14'>14</a>
<a id='n15' href='#n15'>15</a>
<a id='n16' href='#n16'>16</a>
<a id='n17' href='#n17'>17</a>
<a id='n18' href='#n18'>18</a>
<a id='n19' href='#n19'>19</a>
<a id='n20' href='#n20'>20</a>
<a id='n21' href='#n21'>21</a>
<a id='n22' href='#n22'>22</a>
<a id='n23' href='#n23'>23</a>
<a id='n24' href='#n24'>24</a>
<a id='n25' href='#n25'>25</a>
<a id='n26' href='#n26'>26</a>
<a id='n27' href='#n27'>27</a>
<a id='n28' href='#n28'>28</a>
<a id='n29' href='#n29'>29</a>
<a id='n30' href='#n30'>30</a>
<a id='n31' href='#n31'>31</a>
<a id='n32' href='#n32'>32</a>
<a id='n33' href='#n33'>33</a>
<a id='n34' href='#n34'>34</a>
<a id='n35' href='#n35'>35</a>
<a id='n36' href='#n36'>36</a>
<a id='n37' href='#n37'>37</a>
<a id='n38' href='#n38'>38</a>
<a id='n39' href='#n39'>39</a>
<a id='n40' href='#n40'>40</a>
<a id='n41' href='#n41'>41</a>
<a id='n42' href='#n42'>42</a>
<a id='n43' href='#n43'>43</a>
<a id='n44' href='#n44'>44</a>
<a id='n45' href='#n45'>45</a>
<a id='n46' href='#n46'>46</a>
<a id='n47' href='#n47'>47</a>
<a id='n48' href='#n48'>48</a>
<a id='n49' href='#n49'>49</a>
<a id='n50' href='#n50'>50</a>
<a id='n51' href='#n51'>51</a>
<a id='n52' href='#n52'>52</a>
<a id='n53' href='#n53'>53</a>
<a id='n54' href='#n54'>54</a>
<a id='n55' href='#n55'>55</a>
<a id='n56' href='#n56'>56</a>
<a id='n57' href='#n57'>57</a>
<a id='n58' href='#n58'>58</a>
<a id='n59' href='#n59'>59</a>
<a id='n60' href='#n60'>60</a>
<a id='n61' href='#n61'>61</a>
<a id='n62' href='#n62'>62</a>
<a id='n63' href='#n63'>63</a>
<a id='n64' href='#n64'>64</a>
<a id='n65' href='#n65'>65</a>
<a id='n66' href='#n66'>66</a>
<a id='n67' href='#n67'>67</a>
<a id='n68' href='#n68'>68</a>
<a id='n69' href='#n69'>69</a>
<a id='n70' href='#n70'>70</a>
<a id='n71' href='#n71'>71</a>
<a id='n72' href='#n72'>72</a>
<a id='n73' href='#n73'>73</a>
<a id='n74' href='#n74'>74</a>
<a id='n75' href='#n75'>75</a>
<a id='n76' href='#n76'>76</a>
<a id='n77' href='#n77'>77</a>
<a id='n78' href='#n78'>78</a>
<a id='n79' href='#n79'>79</a>
<a id='n80' href='#n80'>80</a>
<a id='n81' href='#n81'>81</a>
<a id='n82' href='#n82'>82</a>
<a id='n83' href='#n83'>83</a>
<a id='n84' href='#n84'>84</a>
<a id='n85' href='#n85'>85</a>
<a id='n86' href='#n86'>86</a>
<a id='n87' href='#n87'>87</a>
<a id='n88' href='#n88'>88</a>
<a id='n89' href='#n89'>89</a>
<a id='n90' href='#n90'>90</a>
<a id='n91' href='#n91'>91</a>
<a id='n92' href='#n92'>92</a>
<a id='n93' href='#n93'>93</a>
<a id='n94' href='#n94'>94</a>
<a id='n95' href='#n95'>95</a>
<a id='n96' href='#n96'>96</a>
<a id='n97' href='#n97'>97</a>
<a id='n98' href='#n98'>98</a>
<a id='n99' href='#n99'>99</a>
<a id='n100' href='#n100'>100</a>
<a id='n101' href='#n101'>101</a>
<a id='n102' href='#n102'>102</a>
<a id='n103' href='#n103'>103</a>
<a id='n104' href='#n104'>104</a>
<a id='n105' href='#n105'>105</a>
<a id='n106' href='#n106'>106</a>
<a id='n107' href='#n107'>107</a>
<a id='n108' href='#n108'>108</a>
<a id='n109' href='#n109'>109</a>
<a id='n110' href='#n110'>110</a>
<a id='n111' href='#n111'>111</a>
<a id='n112' href='#n112'>112</a>
<a id='n113' href='#n113'>113</a>
<a id='n114' href='#n114'>114</a>
<a id='n115' href='#n115'>115</a>
<a id='n116' href='#n116'>116</a>
<a id='n117' href='#n117'>117</a>
<a id='n118' href='#n118'>118</a>
<a id='n119' href='#n119'>119</a>
<a id='n120' href='#n120'>120</a>
<a id='n121' href='#n121'>121</a>
<a id='n122' href='#n122'>122</a>
<a id='n123' href='#n123'>123</a>
<a id='n124' href='#n124'>124</a>
<a id='n125' href='#n125'>125</a>
<a id='n126' href='#n126'>126</a>
<a id='n127' href='#n127'>127</a>
<a id='n128' href='#n128'>128</a>
<a id='n129' href='#n129'>129</a>
<a id='n130' href='#n130'>130</a>
<a id='n131' href='#n131'>131</a>
<a id='n132' href='#n132'>132</a>
<a id='n133' href='#n133'>133</a>
<a id='n134' href='#n134'>134</a>
<a id='n135' href='#n135'>135</a>
<a id='n136' href='#n136'>136</a>
<a id='n137' href='#n137'>137</a>
<a id='n138' href='#n138'>138</a>
<a id='n139' href='#n139'>139</a>
<a id='n140' href='#n140'>140</a>
<a id='n141' href='#n141'>141</a>
<a id='n142' href='#n142'>142</a>
<a id='n143' href='#n143'>143</a>
<a id='n144' href='#n144'>144</a>
<a id='n145' href='#n145'>145</a>
<a id='n146' href='#n146'>146</a>
<a id='n147' href='#n147'>147</a>
<a id='n148' href='#n148'>148</a>
<a id='n149' href='#n149'>149</a>
<a id='n150' href='#n150'>150</a>
<a id='n151' href='#n151'>151</a>
<a id='n152' href='#n152'>152</a>
<a id='n153' href='#n153'>153</a>
<a id='n154' href='#n154'>154</a>
<a id='n155' href='#n155'>155</a>
<a id='n156' href='#n156'>156</a>
<a id='n157' href='#n157'>157</a>
<a id='n158' href='#n158'>158</a>
<a id='n159' href='#n159'>159</a>
<a id='n160' href='#n160'>160</a>
<a id='n161' href='#n161'>161</a>
<a id='n162' href='#n162'>162</a>
<a id='n163' href='#n163'>163</a>
<a id='n164' href='#n164'>164</a>
<a id='n165' href='#n165'>165</a>
<a id='n166' href='#n166'>166</a>
<a id='n167' href='#n167'>167</a>
<a id='n168' href='#n168'>168</a>
<a id='n169' href='#n169'>169</a>
<a id='n170' href='#n170'>170</a>
<a id='n171' href='#n171'>171</a>
<a id='n172' href='#n172'>172</a>
<a id='n173' href='#n173'>173</a>
<a id='n174' href='#n174'>174</a>
<a id='n175' href='#n175'>175</a>
<a id='n176' href='#n176'>176</a>
<a id='n177' href='#n177'>177</a>
<a id='n178' href='#n178'>178</a>
<a id='n179' href='#n179'>179</a>
<a id='n180' href='#n180'>180</a>
<a id='n181' href='#n181'>181</a>
<a id='n182' href='#n182'>182</a>
<a id='n183' href='#n183'>183</a>
<a id='n184' href='#n184'>184</a>
<a id='n185' href='#n185'>185</a>
<a id='n186' href='#n186'>186</a>
<a id='n187' href='#n187'>187</a>
<a id='n188' href='#n188'>188</a>
<a id='n189' href='#n189'>189</a>
<a id='n190' href='#n190'>190</a>
<a id='n191' href='#n191'>191</a>
<a id='n192' href='#n192'>192</a>
<a id='n193' href='#n193'>193</a>
<a id='n194' href='#n194'>194</a>
<a id='n195' href='#n195'>195</a>
<a id='n196' href='#n196'>196</a>
<a id='n197' href='#n197'>197</a>
<a id='n198' href='#n198'>198</a>
<a id='n199' href='#n199'>199</a>
<a id='n200' href='#n200'>200</a>
<a id='n201' href='#n201'>201</a>
<a id='n202' href='#n202'>202</a>
<a id='n203' href='#n203'>203</a>
<a id='n204' href='#n204'>204</a>
<a id='n205' href='#n205'>205</a>
<a id='n206' href='#n206'>206</a>
<a id='n207' href='#n207'>207</a>
<a id='n208' href='#n208'>208</a>
<a id='n209' href='#n209'>209</a>
<a id='n210' href='#n210'>210</a>
<a id='n211' href='#n211'>211</a>
<a id='n212' href='#n212'>212</a>
<a id='n213' href='#n213'>213</a>
<a id='n214' href='#n214'>214</a>
<a id='n215' href='#n215'>215</a>
<a id='n216' href='#n216'>216</a>
<a id='n217' href='#n217'>217</a>
<a id='n218' href='#n218'>218</a>
<a id='n219' href='#n219'>219</a>
<a id='n220' href='#n220'>220</a>
<a id='n221' href='#n221'>221</a>
<a id='n222' href='#n222'>222</a>
<a id='n223' href='#n223'>223</a>
<a id='n224' href='#n224'>224</a>
<a id='n225' href='#n225'>225</a>
</pre></td>
<td class='lines'><pre><code>#compdef git gitk

# zsh completion wrapper for git
#
# Copyright (c) 2012-2013 Felipe Contreras &lt;felipe.contreras&#64;gmail.com&gt;
#
# You need git's bash completion script installed somewhere, by default it
# would be the location bash-completion uses.
#
# If your script is somewhere else, you can configure it on your ~/.zshrc:
#
#  zstyle ':completion:*:*:git:*' script ~/.git-completion.sh
#
# The recommended way to install this script is to copy to '~/.zsh/_git', and
# then add the following to your ~/.zshrc file:
#
#  fpath=(~/.zsh $fpath)

complete ()
{
	# do nothing
	return 0
}

zstyle -T ':completion:*:*:git:*' tag-order &amp;&amp; \
	zstyle ':completion:*:*:git:*' tag-order 'common-commands'

zstyle -s &quot;:completion:*:*:git:*&quot; script script
if [ -z &quot;$script&quot; ]; then
	local -a locations
	local e
	locations=(
		$(dirname ${funcsourcetrace[1]%:*})/git-completion.bash
		'/etc/bash_completion.d/git' # fedora, old debian
		'/usr/share/bash-completion/completions/git' # arch, ubuntu, new debian
		'/usr/share/bash-completion/git' # gentoo
		)
	for e in $locations; do
		test -f $e &amp;&amp; script=&quot;$e&quot; &amp;&amp; break
	done
fi
ZSH_VERSION='' . &quot;$script&quot;

__gitcomp ()
{
	emulate -L zsh

	local cur_=&quot;${3-$cur}&quot;

	case &quot;$cur_&quot; in
	--*=)
		;;
	*)
		local c IFS=$' \t\n'
		local -a array
		for c in ${=1}; do
			c=&quot;$c${4-}&quot;
			case $c in
			--*=*|*.) ;;
			*) c=&quot;$c &quot; ;;
			esac
			array+=(&quot;$c&quot;)
		done
		compset -P '*[=:]'
		compadd -Q -S '' -p &quot;${2-}&quot; -a -- array &amp;&amp; _ret=0
		;;
	esac
}

__gitcomp_nl ()
{
	emulate -L zsh

	local IFS=$'\n'
	compset -P '*[=:]'
	compadd -Q -S &quot;${4- }&quot; -p &quot;${2-}&quot; -- ${=1} &amp;&amp; _ret=0
}

__gitcomp_nl_append ()
{
	emulate -L zsh

	local IFS=$'\n'
	compadd -Q -S &quot;${4- }&quot; -p &quot;${2-}&quot; -- ${=1} &amp;&amp; _ret=0
}

__gitcomp_file ()
{
	emulate -L zsh

	local IFS=$'\n'
	compset -P '*[=:]'
	compadd -Q -p &quot;${2-}&quot; -f -- ${=1} &amp;&amp; _ret=0
}

__git_zsh_bash_func ()
{
	emulate -L ksh

	local command=$1

	local completion_func=&quot;_git_${command//-/_}&quot;
	declare -f $completion_func &gt;/dev/null &amp;&amp; $completion_func &amp;&amp; return

	local expansion=$(__git_aliased_command &quot;$command&quot;)
	if [ -n &quot;$expansion&quot; ]; then
		words[1]=$expansion
		completion_func=&quot;_git_${expansion//-/_}&quot;
		declare -f $completion_func &gt;/dev/null &amp;&amp; $completion_func
	fi
}

__git_zsh_cmd_common ()
{
	local -a list
	list=(
	add:'add file contents to the index'
	bisect:'find by binary search the change that introduced a bug'
	branch:'list, create, or delete branches'
	checkout:'checkout a branch or paths to the working tree'
	clone:'clone a repository into a new directory'
	commit:'record changes to the repository'
	diff:'show changes between commits, commit and working tree, etc'
	fetch:'download objects and refs from another repository'
	grep:'print lines matching a pattern'
	init:'create an empty Git repository or reinitialize an existing one'
	log:'show commit logs'
	merge:'join two or more development histories together'
	mv:'move or rename a file, a directory, or a symlink'
	pull:'fetch from and merge with another repository or a local branch'
	push:'update remote refs along with associated objects'
	rebase:'forward-port local commits to the updated upstream head'
	reset:'reset current HEAD to the specified state'
	rm:'remove files from the working tree and from the index'
	show:'show various types of objects'
	status:'show the working tree status'
	tag:'create, list, delete or verify a tag object signed with GPG')
	_describe -t common-commands 'common commands' list &amp;&amp; _ret=0
}

__git_zsh_cmd_alias ()
{
	local -a list
	list=(${${${(0)&quot;$(git config -z --get-regexp '^alias\.')&quot;}#alias.}%$'\n'*})
	_describe -t alias-commands 'aliases' list $* &amp;&amp; _ret=0
}

__git_zsh_cmd_all ()
{
	local -a list
	emulate ksh -c __git_compute_all_commands
	list=( ${=__git_all_commands} )
	_describe -t all-commands 'all commands' list &amp;&amp; _ret=0
}

__git_zsh_main ()
{
	local curcontext=&quot;$curcontext&quot; state state_descr line
	typeset -A opt_args
	local -a orig_words

	orig_words=( ${words[&#64;]} )

	_arguments -C \
		'(-p --paginate --no-pager)'{-p,--paginate}'[pipe all output into ''less'']' \
		'(-p --paginate)--no-pager[do not pipe git output into a pager]' \
		'--git-dir=-[set the path to the repository]: :_directories' \
		'--bare[treat the repository as a bare repository]' \
		'(- :)--version[prints the git suite version]' \
		'--exec-path=-[path to where your core git programs are installed]:: :_directories' \
		'--html-path[print the path where git''s HTML documentation is installed]' \
		'--info-path[print the path where the Info files are installed]' \
		'--man-path[print the manpath (see `man(1)`) for the man pages]' \
		'--work-tree=-[set the path to the working tree]: :_directories' \
		'--namespace=-[set the git namespace]' \
		'--no-replace-objects[do not use replacement refs to replace git objects]' \
		'(- :)--help[prints the synopsis and a list of the most commonly used commands]: :-&gt;arg' \
		'(-): :-&gt;command' \
		'(-)*:: :-&gt;arg' &amp;&amp; return

	case $state in
	(command)
		_alternative \
                         'alias-commands:alias:__git_zsh_cmd_alias' \
                         'common-commands:common:__git_zsh_cmd_common' \
                         'all-commands:all:__git_zsh_cmd_all' &amp;&amp; _ret=0
		;;
	(arg)
		local command=&quot;${words[1]}&quot; __git_dir

		if (( $+opt_args[--bare] )); then
			__git_dir='.'
		else
			__git_dir=${opt_args[--git-dir]}
		fi

		(( $+opt_args[--help] )) &amp;&amp; command='help'

		words=( ${orig_words[&#64;]} )

		__git_zsh_bash_func $command
		;;
	esac
}

_git ()
{
	local _ret=1
	local cur cword prev

	cur=${words[CURRENT]}
	prev=${words[CURRENT-1]}
	let cword=CURRENT-1

	if (( $+functions[__${service}_zsh_main] )); then
		__${service}_zsh_main
	else
		emulate ksh -c __${service}_main
	fi

	let _ret &amp;&amp; _default &amp;&amp; _ret=0
	return _ret
}

_git
</code></pre></td></tr></table>
</div> <!-- class=content -->
<div class='footer'>generated  by cgit v0.10.1 at 2014-08-17 09:45:35 (GMT)</div>
</div> <!-- id=cgit -->
</body>
</html>
