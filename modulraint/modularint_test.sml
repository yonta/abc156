structure ModularIntTest =
struct
  val modulo = IntInf.fromInt ModularInt.modulo

  fun add01 () =
      let
        val expected = 3
        val actual = ModularInt.+ (1, 2)
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end
  fun add02 () =
      let
        val expected = 3
        val actual = ModularInt.+ (ModularInt.modulo - 1, 4)
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end

  fun sub01 () =
      let
        val expected = 1
        val actual = ModularInt.- (3, 2)
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end
  fun sub02 () =
      let
        val expected = ModularInt.modulo - 1
        val actual = ModularInt.- (0, 1)
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end

  fun mul01 () =
      let
        val expected = 6
        val actual = ModularInt.* (2, 3)
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end
  fun mul02 () =
      let
        val expected = 999999937
        val actual = ModularInt.* (100000, 100000)
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end

  fun div01 () =
      let
        val expected = 2
        val actual = ModularInt.div (6, 3)
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end
  fun div02 () =
      let
        val expected = 333333669
        val actual = ModularInt.div (1000, 3)
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end

  fun mod01 () =
      let
        val expected = 1
        val actual = ModularInt.mod (3, 2)
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end

  fun pow01 () =
      let
        val expected = IntInf.toInt (IntInf.pow (2, 10))
        val actual = ModularInt.pow 2 10
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end
  fun pow02 () =
      let
        val expected = 140625001
        val actual = ModularInt.pow 2 1000000000
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end

  fun nCk01 () =
      let
        val expected = 20
        val actual = ModularInt.nCk 6 3
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end
  fun nCk02 () =
      let
        val expected = 811665831
        val actual = ModularInt.nCk 1024 256
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end

  fun inverse01 () =
      let
        val expected = ModularInt.pow 1000 (IntInf.toInt modulo - 2)
        val actual = ModularInt.inverse 1000
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end

  fun factorial n =
      let
        val l = List.tabulate (n, fn i => IntInf.fromInt i + 1)
        val inf = foldl IntInf.* 1 l
        val inf = inf mod modulo
      in
        IntInf.toInt inf
      end
  fun factorial01 () =
      let
        val expected = factorial 10
        val actual = ModularInt.factorial 10
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end
  fun factorial02 () =
      let
        val expected = factorial 1000
        val actual = ModularInt.factorial 1000
      in
        SMLUnit.Assert.assertEqualInt expected actual
      end

  val suite =
      SMLUnit.Test.labelTests
        [
          ("add01", add01),
          ("add02", add02),
          ("sub01", sub01),
          ("sub02", sub02),
          ("mul01", mul01),
          ("mul02", mul02),
          ("div01", div01),
          ("div02", div02),
          ("mod01", mod01),
          ("pow01", pow01),
          ("pow02", pow02),
          ("nCk01", nCk01),
          ("nCk02", nCk02),
          ("inverse01", inverse01),
          ("factorial01", factorial01),
          ("factorial02", factorial02)
        ]
end
