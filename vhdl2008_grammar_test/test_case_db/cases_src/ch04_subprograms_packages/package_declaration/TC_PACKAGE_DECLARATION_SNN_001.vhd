-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "is" keyword - package p_bad <missing is> ... end package, identifier directly touches package_declarative_part and becomes illegal
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pd_nois_ent is port(r:out integer); end entity;
architecture bh of pd_nois_ent is
  -- ERROR: missing 'is' keyword after package identifier
  package p_broken
    constant C:integer:=1;
  end package p_broken;
begin
  r<=0;
end architecture bh;
