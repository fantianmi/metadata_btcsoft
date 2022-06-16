/**
 ██████╗ ██╗      ██████╗ ██████╗  █████╗ ██╗          ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ ██╗   ██╗██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
██╔════╝ ██║     ██╔═══██╗██╔══██╗██╔══██╗██║         ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ ██║   ██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
██║  ███╗██║     ██║   ██║██████╔╝███████║██║         ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗██║   ██║██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║
██║   ██║██║     ██║   ██║██╔══██╗██╔══██║██║         ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║██║   ██║██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
╚██████╔╝███████╗╚██████╔╝██████╔╝██║  ██║███████╗    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝╚██████╔╝██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
 ╚═════╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
                                                                                                                                                             
 */


const chainId = 1
var currentAccount = "";

/**
 ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗         ███╗   ███╗███████╗████████╗██╗  ██╗ ██████╗ ██████╗      ██████╗██╗      █████╗ ███████╗███████╗
██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║         ████╗ ████║██╔════╝╚══██╔══╝██║  ██║██╔═══██╗██╔══██╗    ██╔════╝██║     ██╔══██╗██╔════╝██╔════╝
██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║         ██╔████╔██║█████╗     ██║   ███████║██║   ██║██║  ██║    ██║     ██║     ███████║███████╗███████╗
██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║         ██║╚██╔╝██║██╔══╝     ██║   ██╔══██║██║   ██║██║  ██║    ██║     ██║     ██╔══██║╚════██║╚════██║
╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗    ██║ ╚═╝ ██║███████╗   ██║   ██║  ██║╚██████╔╝██████╔╝    ╚██████╗███████╗██║  ██║███████║███████║
 ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚═╝     ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝      ╚═════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝
 */

function updateHTML(value, elId) {
  const span = document.getElementById(elId);
  span.innerText = value;
}

function isRealNum(val) {
  // isNaN()函数 把空串 空格 以及NUll 按照0来处理 所以先去除，

  if (val === "" || val == null) {
    return false;
  }
  if (!isNaN(val)) {
    //对于空数组和只有一个数值成员的数组或全是数字组成的字符串，isNaN返回false，例如：'123'、[]、[2]、['123'],isNaN返回false,
    //所以如果不需要val包含这些特殊情况，则这个判断改写为if(!isNaN(val) && typeof val === 'number' )
    return true;
  } else {
    return false;
  }
}

function syntaxHighlight(json) {
  if (typeof json != 'string') {
    json = JSON.stringify(json, undefined, 2);
  }
  json = json.replace(/&/g, '&').replace(/</g, '<').replace(/>/g, '>');
  return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g,
    function (match) {
      var cls = 'number';
      if (/^"/.test(match)) {
        if (/:$/.test(match)) {
          cls = 'key';
        } else {
          cls = 'string';
        }
      } else if (/true|false/.test(match)) {
        cls = 'boolean';
      } else if (/null/.test(match)) {
        cls = 'null';
      }
      return '<span class="' + cls + '">' + match + '</span>';
    }
  );
}

// common function tools
/**
 * 检查是否登录，且是否为管理员
 * @returns 
 */
function islogin() {
  let pathname = window.location.pathname
  if (pathname == "/login.html") return;

  //设置默认用户地址
  web3.eth.getAccounts(function (err, res) {
    let address = res[0];
    if (!isadmin(address)) {
      alert("请使用管理员钱包登录")
      window.location.href = "login.html";
    } else {
      currentAccount = address;
    }
  });
}

function checkAddress(address) {

}

function isadmin(address) {
  if (typeof (address) == "undefined") {
    return false;
  }
  const target = "/admin/public/login";
  const post = {username: address}
  $.post(target, post).success(function (data) {
    console.log(data);
    if (data.status == 1) {
      if (data.url) {
        toast.success(data.info + ' 页面即将自动跳转~');
      } else {
        toast.success(data.info );
      }
      location.href = data.url;
    } else {
      toast.error("your wallet address is not in our database");
    }
  });

  // for (var i = 0; i < admin.length; i++) {
  //   let adminAddress = admin[i];
  //   if (address.toLowerCase() == adminAddress.toLowerCase()) {
  //     return true;
  //   }
  // }
  return true;
}

function prettyAddress(address) {
  return address.substring(0, 5) + "...." + address.substring(address.length - 4, address.length);
}

/**
██████╗  █████╗  ██████╗ ███████╗    ██╗███╗   ██╗██╗████████╗██╗ █████╗ ██╗     ██╗███████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗    ██████╗ ███████╗███╗   ██╗██████╗ ███████╗██████╗ ██╗███╗   ██╗ ██████╗ 
██╔══██╗██╔══██╗██╔════╝ ██╔════╝    ██║████╗  ██║██║╚══██╔══╝██║██╔══██╗██║     ██║╚══███╔╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔════╝████╗  ██║██╔══██╗██╔════╝██╔══██╗██║████╗  ██║██╔════╝ 
██████╔╝███████║██║  ███╗█████╗      ██║██╔██╗ ██║██║   ██║   ██║███████║██║     ██║  ███╔╝ ███████║   ██║   ██║██║   ██║██╔██╗ ██║    ██████╔╝█████╗  ██╔██╗ ██║██║  ██║█████╗  ██████╔╝██║██╔██╗ ██║██║  ███╗
██╔═══╝ ██╔══██║██║   ██║██╔══╝      ██║██║╚██╗██║██║   ██║   ██║██╔══██║██║     ██║ ███╔╝  ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║    ██╔══██╗██╔══╝  ██║╚██╗██║██║  ██║██╔══╝  ██╔══██╗██║██║╚██╗██║██║   ██║
██║     ██║  ██║╚██████╔╝███████╗    ██║██║ ╚████║██║   ██║   ██║██║  ██║███████╗██║███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║    ██║  ██║███████╗██║ ╚████║██████╔╝███████╗██║  ██║██║██║ ╚████║╚██████╔╝
╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   ╚═╝╚═╝  ╚═╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
                                                                                                                                                                                                               
 */
//page start
$(function () {
  init();
});


function init() {
  initWeb3();
}


/**
 * 检查状态，并更新元素
 */
function initbaseFrame() {
  showCurrentAccount = prettyAddress(currentAccount)
  updateHTML(showCurrentAccount, "managerAddress")
  islogin();
}
/* every second query smart contract for status */
function updateUI() {
  setInterval(function () {
    initbaseFrame();
  }, 1000);
}


function initWeb3() {
  if (typeof web3 !== 'undefined') {
    web3Provider = web3.currentProvider;
  } else {
    web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
  }
  web3 = new Web3(web3Provider);
  // web3.isConnected
  initContract();
  // islogin();
}


/**
 ██████╗  █████╗  ██████╗ ███████╗    ██████╗  █████╗ ████████╗ █████╗     ██╗      ██████╗  █████╗ ██████╗ ██╗███╗   ██╗ ██████╗ 
██╔══██╗██╔══██╗██╔════╝ ██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗    ██║     ██╔═══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ 
██████╔╝███████║██║  ███╗█████╗      ██║  ██║███████║   ██║   ███████║    ██║     ██║   ██║███████║██║  ██║██║██╔██╗ ██║██║  ███╗
██╔═══╝ ██╔══██║██║   ██║██╔══╝      ██║  ██║██╔══██║   ██║   ██╔══██║    ██║     ██║   ██║██╔══██║██║  ██║██║██║╚██╗██║██║   ██║
██║     ██║  ██║╚██████╔╝███████╗    ██████╔╝██║  ██║   ██║   ██║  ██║    ███████╗╚██████╔╝██║  ██║██████╔╝██║██║ ╚████║╚██████╔╝
╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝    ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
 */

function checkWallet(){
  try {
    //ethereum.request('eth_requestAccounts')
    ethereum.enable();
    //设置默认用户地址
    web3.eth.getAccounts(function (err, res) {
      let address = res[0];
      if (typeof (address) == "undefined") {
        // logout()
        return;
      }
      const target = "/admin/public/login";
      const post = {username: address}
      $.post(target, post).success(function (data) {
        if (data.status != 1) {
          logout()
        }
      });
    });

  } catch (error) {
    // logout()
    return;
  }
}

function logout(){
  $.get("admin/public/logout",function(res){
    location.href = "/admin/public/login";
  })
}

/**
 * login
 */
function connectWallet() {
  try {
    //ethereum.request('eth_requestAccounts')
    ethereum.enable();
    //设置默认用户地址

    web3.eth.getAccounts(function (err, res) {
      let address = res[0];
      console.log(res)
      if (typeof (address) == "undefined") {
        alert("未获取到钱包地址")
        return;
      }
      if (!isadmin(address)) {
        alert("请使用管理员钱包登录")
        return;

      } else {
        // window.location.href = "admin.html";
      }
    });

  } catch (error) {
    alert("用户取消授权");
    return;
  }

}

/**
 * 初始化合约
 */
function initContract() {
  const networkName = "ethereum main net";
  window.ethereum.request({
    method: "wallet_switchEthereumChain",
    params: [{
      chainId: web3.utils.toHex(chainId)
    }],
  }).then(handleAccountsChanged(chainId, networkName));
}

function handleAccountsChanged(pageChainId, networkName) {
  console.log("handleAccountsChanged")
  web3.eth.net.getId((err, netId) => {
    if (netId !== pageChainId) {
      alert("请将钱包切换至" + networkName)
      location.href = location.href;
      return;
    }
    initEventListeners();
  });
}

/**
 * 监听合约结果
 */
function initEventListeners() {

}

function initPageData() {
  let page = getPage();
  if (page == "mainnet") loadMainnet();
  else if (page == "polygon") loadPolygon();
}

function getPage() {
  let pathname = window.location.pathname
  if (pathname == "/mainnet.html") return "mainnet";
  else if (pathname == "/polygon.html") return "polygon";
  else return "admin"
}




/**
██████╗ ██████╗ ███╗   ██╗████████╗██████╗  █████╗  ██████╗████████╗    ██████╗  █████╗ ████████╗ █████╗     ██╗      ██████╗  █████╗ ██████╗ ██╗███╗   ██╗ ██████╗ 
██╔════╝██╔═══██╗████╗  ██║╚══██╔══╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝    ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗    ██║     ██╔═══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ 
██║     ██║   ██║██╔██╗ ██║   ██║   ██████╔╝███████║██║        ██║       ██║  ██║███████║   ██║   ███████║    ██║     ██║   ██║███████║██║  ██║██║██╔██╗ ██║██║  ███╗
██║     ██║   ██║██║╚██╗██║   ██║   ██╔══██╗██╔══██║██║        ██║       ██║  ██║██╔══██║   ██║   ██╔══██║    ██║     ██║   ██║██╔══██║██║  ██║██║██║╚██╗██║██║   ██║
╚██████╗╚██████╔╝██║ ╚████║   ██║   ██║  ██║██║  ██║╚██████╗   ██║       ██████╔╝██║  ██║   ██║   ██║  ██║    ███████╗╚██████╔╝██║  ██║██████╔╝██║██║ ╚████║╚██████╔╝
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝       ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝    ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
                                                                                                                                                                     
 */

let queryTotalSupply = 0,
  queryDecimals = 0,
  queryName = "",
  querySymbol = "",
  queryContractAddress = "";


function loadMainnet() {
  queryContractAddress = mainnet;
  updateHTML(queryContractAddress, "queryContractAddress")

  mainnetContract.methods.name().call({}, function (err, res) {
    queryName = res;
    updateHTML(queryName, "queryName")
  });
  mainnetContract.methods.symbol().call({}, function (err, res) {
    querySymbol = res;
    updateHTML(querySymbol, "querySymbol")
  });
  mainnetContract.methods.decimals().call({}, function (err, res) {
    queryDecimals = res;
    updateHTML(queryDecimals, "queryDecimals")
  });
  mainnetContract.methods.totalSupply().call({}, function (err, res) {
    queryTotalSupply = res;
    console.log("queryTotalSupply", queryTotalSupply)
    console.log("queryDecimals", queryDecimals)
    let totalSupply = new BigNumber(queryTotalSupply).div(new BigNumber(10).pow(queryDecimals))
    // let totalSupply = queryEthTotalSupply/(Math.pow(10, queryDecimals))
    updateHTML(new Number(totalSupply).toLocaleString(), "queryTotalSupply")
  });
}


function loadPolygon() {
  queryContractAddress = polygon
  updateHTML(queryContractAddress, "queryContractAddress")
  polygonContract.methods.name().call({}, function (err, res) {
    queryName = res;
    updateHTML(queryName, "queryName")
  });
  polygonContract.methods.symbol().call({}, function (err, res) {
    querySymbol = res;
    updateHTML(querySymbol, "querySymbol")
  });
  polygonContract.methods.decimals().call({}, function (err, res) {
    queryDecimals = res;
    updateHTML(queryDecimals, "queryDecimals")
  });
  polygonContract.methods.totalSupply().call({}, function (err, res) {
    queryTotalSupply = res;
    console.log("queryTotalSupply", queryTotalSupply)
    console.log("queryDecimals", queryDecimals)
    let totalSupply = new BigNumber(queryTotalSupply).div(new BigNumber(10).pow(queryDecimals))
    // let totalSupply = queryEthTotalSupply/(Math.pow(10, queryDecimals))
    updateHTML(new Number(totalSupply).toLocaleString(), "queryTotalSupply")
  });
}


function mint() {
  let amount = $("#mintAmount").val()
  const address = $("#mintAddress").val()
  const BN = web3.utils.BN;
  amount = new BigNumber(amount).times(new BigNumber(10).pow(queryDecimals)).toFormat(0,BigNumber.ROUND_UP,{decimalSeparator:''})
  console.log("amount", amount)
  console.log("address", address)
  mainnetContract.methods.mint(address, new BN(amount)).send({
    from: currentAccount
  }, (err, res) => {
    console.log("err", err)
    console.log("res", res)
    $("#mintResult").html(syntaxHighlight(res))
  })
}

function transfer(network) {
  let amount = $("#transferAmount").val()
  const address = $("#transferAddress").val()
  const BN = web3.utils.BN;

  amount = new BigNumber(amount).times(new BigNumber(10).pow(queryDecimals)).toFormat(0,BigNumber.ROUND_UP,{decimalSeparator:''})
  console.log("amount", amount)
  console.log("address", address)

  const contract = network == chainId ? mainnetContract : polygonContract;
  contract.methods.transfer(address, new BN(amount)).send({
    from: currentAccount
  }, (err, res) => {
    console.log("err", err)
    console.log("res", res)
    $("#transferResult").html(syntaxHighlight(res))
  })
}

function balanceOf(network) {
  const contract = network == chainId ? mainnetContract : polygonContract;
  const account = $("#balanceOfAccount").val()
  console.log("account", account)
  contract.methods.balanceOf(account).call({}, (err, res) => {
    console.log("err", err)
    console.log("res", res)
    const print = res / (Math.pow(10, queryDecimals))
    $("#balanceOfResult").html(syntaxHighlight(print))
  })
}



function getOwner(network) {
  const contract = network == chainId ? mainnetContract : polygonContract;
  contract.methods.owner().call({}, function (err, res) {
    owner = res;
    updateHTML(prettyAddress(res), "owner")
  });
}
