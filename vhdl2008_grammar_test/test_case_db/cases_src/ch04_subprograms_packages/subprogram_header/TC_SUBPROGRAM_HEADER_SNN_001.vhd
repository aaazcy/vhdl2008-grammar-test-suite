-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ] [ parameter ] ( formal_parameter_list )
-- Case Type: Negative
-- Test Focus: SNN: the interface declaration of generic_clause is missing the right parenthesis — in generic(type t the type interface declaration is not closed with ')' before the parameter keyword appears, verifies the generic_interface_list of generic_clause requires complete parenthesis closure
-- Expected Result: Triggers syntax error: ';' or ')' expected after interface
-- Dependencies: None
-- =============================================================
entity sh_gen_ent is port(r:out integer); end entity;
architecture bh of sh_gen_ent is
  function f_bad generic(type t parameter(x:t) return t is
  begin return x; end function;
begin
  r<=0;
end architecture bh;
