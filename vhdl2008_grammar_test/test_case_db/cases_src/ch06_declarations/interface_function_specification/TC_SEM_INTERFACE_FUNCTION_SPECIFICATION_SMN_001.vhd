-- =============================================================
-- Case ID: TC_SEM_INTERFACE_FUNCTION_SPECIFICATION_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_function_specification ::= [ pure | impure ] function designator [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Negative (Semantic)
-- Test Focus: interface function specification declares return type integer, but the default function body returns boolean — type mismatch at elaboration
-- Expected Result: Triggers semantic error (return type mismatch)
-- Dependencies: None
-- =============================================================

-- ERROR: generic function interface requires integer return, but default
-- function 'test_val' returns boolean — incompatible profiles.
entity ifunc_spec_sem1 is
  generic (
    g_check : function test_val (x : integer) return integer
  );
  port (
    val : in  integer;
    ok  : out boolean
  );
end entity ifunc_spec_sem1;

architecture bh of ifunc_spec_sem1 is
  function test_val (x : integer) return boolean is
  begin
    return x > 0;
  end function;
begin
  ok <= g_check(val) > 0;
end architecture bh;
