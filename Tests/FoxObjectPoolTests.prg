Define Class FoxObjectPoolTests As FxuTestCase Of FxuTestCase.prg

	#If .F.
		Local This As FoxObjectPoolTests Of FoxObjectPoolTests.prg
	#Endif
	icTestPrefix = "Test"
	oObjPool  = .Null.
	cProcAct = ""
&& ======================================================================== &&
&& Function Setup
&& ======================================================================== &&
	Function Setup
		This.cProcAct = Set("Procedure")
		Set Path To "Src" Additive
		Set Procedure To "AbstractObjectPool.prg" Additive
		This.oObjPool = Createobject("AbstractObjectPool")
	Endfunc
&& ======================================================================== &&
&& Function TearDown
&& ======================================================================== &&
	Function TearDown
		Local lcProcAct As String
		lcProcAct = This.cProcAct
		This.oObjPool = .Null.
		Clear Class AbstractObjectPool
		Release Procedure AbstractObjectPool
		If Not Empty(lcProcAct)
			Set Procedure To (lcProcAct)
		Endif
	Endfunc
&& ======================================================================== &&
&& Function TestObject
&& ======================================================================== &&
	Function TestObject
		If This.AssertNotNull(This.oObjPool, "Test Failed")
			This.MessageOut("Object created Ok")
		Endif
	Endfunc
Enddefine