-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Positive
-- Test Focus: minimal form: function as subprogram_kind in the end clause of subprogram_body — end function, verifies the subprogram_kind::=function branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sk_func_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sk_func_ent is
  function f_id(x:integer) return integer is
  begin return x; end function;
begin
  y<=f_id(a);
end architecture bh;
