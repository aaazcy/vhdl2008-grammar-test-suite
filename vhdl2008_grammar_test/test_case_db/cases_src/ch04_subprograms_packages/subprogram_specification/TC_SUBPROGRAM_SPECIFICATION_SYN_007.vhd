-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Positive
-- Test Focus: dual branches of procedure_specification + function_specification in the same declarative region: two different subprogram_specifications coexist, verifies the alternating use of the two branches
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_ss_both is
  procedure p_set(signal v:out integer);
  function f_get(signal v:integer) return integer;
end package pkg_ss_both;
package body pkg_ss_both is
  procedure p_set(signal v:out integer) is begin v<=42; end procedure;
  function f_get(signal v:integer) return integer is begin return v; end function;
end package body pkg_ss_both;
entity ss_both_ent is port(r:out integer); end entity;
architecture bh of ss_both_ent is
  signal s_val:integer:=0;
begin
  work.pkg_ss_both.p_set(s_val);
  r<=work.pkg_ss_both.f_get(s_val);
end architecture bh;
