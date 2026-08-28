-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: subprogram_body appears in package declarative_part - package declaration region allows only forward declaration and cannot contain a body
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pdp_bad_ent is port(r:out integer); end entity;
architecture bh of pdp_bad_ent is
  package p_bad is
    -- ERROR: subprogram_body not allowed in package_declarative_part
    function f_broken return integer is begin return 0; end function;
  end package p_bad;
begin
  r<=0;
end architecture bh;
