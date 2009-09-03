function toogleFriendForm(obj) {
	var friendForm=$('add_friend_form');
	var slideForm = new Fx.Slide('add_friend_form');						
	
	friendForm.getElements('textarea').set('value','');	
	if(friendForm.getStyle('display')=='none') {
		friendForm.setStyle('display','block');	
		slideForm.hide();	
	}
	slideForm.toggle();
	slideForm.addEvent('complete', function() {friendForm.getElement('textarea').focus();});
}

function ajaxAddUserFriend(obj,idUser,sAction) {
	obj   = $(obj).getParent('li');
	
	if(sAction!='link') {
		sText = obj.getElement('form textarea').get('value');
		obj.getElement('form').getChildren().each(function(item){item.setProperty('disabled','disabled')});
	} else {
		sText='';
	}
	
	JsHttpRequest.query(
    	aRouter.profile+'ajaxfriendadd/',                       
        { idUser: idUser,userText: sText },
        function(result, errors) {  
        	if (!result) {
                msgErrorBox.alert('Error','Please try again later');         
				obj.getElement('form').getChildren().each(function(item){item.removeProperty('disabled')});
        	}
            if (result.bStateError) {
            	msgErrorBox.alert(result.sMsgTitle,result.sMsg);
				obj.getElement('form').getChildren().each(function(item){item.removeProperty('disabled')});
            } else {            	
            	msgNoticeBox.alert(result.sMsgTitle,result.sMsg);
            	if (obj)  {           		
            		item = new Element('li',{'html':result.sToggleText});
					item.getElement('li').inject(obj.getParent('ul'),'top');            		
 	          		obj.dispose();
            	}
            }                               
        },
        true
    );
}

function ajaxDeleteUserFriend(obj,idUser,sAction) {   
	obj=$(obj).getParent('li');
	JsHttpRequest.query(
    	aRouter.profile+'ajaxfrienddelete/',                         
        { idUser: idUser,sAction: sAction },
        function(result, errors) {  
        	if (!result) {
                msgErrorBox.alert('Error','Please try again later');           
        	}
            if (result.bStateError) {
            	msgErrorBox.alert(result.sMsgTitle,result.sMsg);
            } else {            	
            	msgNoticeBox.alert(result.sMsgTitle,result.sMsg);
            	if (obj)  {            		
            		item = new Element('li',{'html':result.sToggleText});
					item.getElement('li').inject(obj.getParent('ul'),'top');            		
					obj.dispose();
            	}
            }                               
        },
        true
    );
}
