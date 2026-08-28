-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: SNN: missing ";" separator between generic_clause and package_declarative_part - constant appears directly after generic(W:integer:=8), missing required semicolon to close generic_clause
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ph_nosemi_ent is port(r:out integer); end entity;
architecture bh of ph_nosemi_ent is
  -- ERROR: missing ';' after generic_clause, package_header not properly terminated
  package p_bad is
    generic(W:integer:=8)
    constant C:w:=1;
  end package p_bad;
begin
  r<=0;
end architecture bh;
