//Using underscorejs 1.4.4 for creating Tree 
var arr = [
        {'id':1 ,'parentid' : 0,'label':'Asia'},
        {'id':2 ,'parentid' : 1,'label':'India'},
        {'id':3 ,'parentid' : 1,'label':'Japan'},
        {'id':4 ,'parentid' : 2,'label':'Mumbai'},
        {'id':5 ,'parentid' : 0,'label':'Europe'},
        {'id':6 ,'parentid' : 0,'label':'Australia'},
        {'id':7 ,'parentid' : 4,'label':'Mulund'}
];

unflatten = function( array, parent, tree ){
   
    tree = typeof tree !== 'undefined' ? tree : [];
    parent = typeof parent !== 'undefined' ? parent : { id: 0 };
        
    var children = _.filter( array, function(child){ return child.parentid == parent.id; });
    
    if( !_.isEmpty( children )  ){
        if( parent.id == 0 ){
           tree = children;   
        }else{
           parent['children'] = children
        }
        _.each( children, function( child ){ unflatten( array, child ) } );                    
    }
    
    return tree;
}

tree = unflatten( arr );
document.body.innerHTML = "<pre>" + (JSON.stringify(tree, null, " "))
