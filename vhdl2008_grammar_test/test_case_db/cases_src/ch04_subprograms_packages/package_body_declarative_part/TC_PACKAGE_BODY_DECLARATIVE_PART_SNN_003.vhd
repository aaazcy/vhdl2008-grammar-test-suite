-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Negative
-- Test Focus: package_body_declarative_part: subprogram_declaration without body — a bare subprogram_declaration (forward declaration) inside a package body is valid syntax (it is a package_body_declarative_item), but if the corresponding subprogram_body is never provided, calling the subprogram triggers a semantic error at elaboration
-- Expected Result: Triggers semantic error: missing subprogram body
-- Dependencies: None
-- =============================================================
entity pbdp_forward_no_body is
  port (
    x, y : in  real;
    prod : out real
  );
end entity;

architecture test of pbdp_forward_no_body is
  -- This is a valid package_body_declarative_item (subprogram_declaration)
  -- but the corresponding body is never defined, creating a semantic error
  -- when an attempt is made to call it
  function f_multiply(a, b : real) return real;

  -- No matching function body for f_multiply exists
  -- Call below would fail with elaboration error
  signal s_prod : real := 0.0;
begin
  s_prod <= f_multiply(x, y);
  prod   <= s_prod;
end architecture test;
