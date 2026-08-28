-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_body: minimal body with 'end' only (no optional 'package body' or identifier) — exercises the minimal valid syntax where optional trailing elements are omitted
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_body_minimal_end is
  port (
    ok_out : out boolean
  );
end entity pkg_body_minimal_end;

architecture test of pkg_body_minimal_end is
  constant C_VERSION : string(1 to 5) := "1.0.0";
  constant C_READY   : boolean := true;
begin
  ok_out <= C_READY;
end architecture test;
