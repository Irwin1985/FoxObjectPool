&& ======================================================================== &&
&& Class AbstractObjectPool
&& ======================================================================== &&
Define Class AbstractObjectPool As Custom
    Hidden nMinInstances
    Hidden nMaxInstances
    Hidden nWaitTime
    Hidden oFullStack
    Hidden oUseStack
    Hidden oFreeStack
    Hidden oPoolableObject
&& ======================================================================== &&
&& Function Init
&& ======================================================================== &&
    Function Init
        lParameters ;
        tnMinInstances      As Integer, ;
        tnMaxInstances      As Integer, ;
        tnWaitTime          As Integer, ;
        toPoolableObject    As Object

        With This
            .nMaxInstances   = evl(tnMaxInstances, 0)
            .nMinInstances   = evl(tnMinInstances, 0)
            .nWaitTime       = evl(tnWaitTime, 0)
            .oPoolableObject = evl(toPoolableObject, .Null.)
            .InitStack()
            .InitPool()
        EndWith
    EndFunc
&& ======================================================================== &&
&& Hidden Function InitStack
&& ======================================================================== &&
    Hidden Function InitStack As Void
        Set Procedure To "FoxStack" Additive
        With This
            .oFullStack = CreateObject("FoxStack")
            .oUseStack  = CreateObject("FoxStack")
            .oFreeStack = CreateObject("FoxStack")
        EndWith
    EndFunc
&& ======================================================================== &&
&& Function InitPool
&& ======================================================================== &&
    Function InitPool As Void
        For nIndex = This.oFullStack.Size() To This.nMinInstances
            loNewPooledObject = This.oPoolableObject.CreateNewPooledObject()
            This.oFreeStack.Push(loNewPooledObject)
        EndFor
    EndFunc
EndDefine