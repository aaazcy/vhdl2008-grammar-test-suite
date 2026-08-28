-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: minimal form: subprogram_header omitted (no generic_clause), the function has only a type_mark without generic header, verifies the minimal compilable form with the subprogram_header slot empty
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sh_min_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sh_min_ent is
  function f_min(x,y:integer) return integer is
  begin return x+y; end function;
begin
  y<=f_min(a,b);
end architecture bh;
