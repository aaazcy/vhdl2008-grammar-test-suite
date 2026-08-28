-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Negative
-- Test Focus: basic_identifier referencing an undeclared identifier(undeclared_sig) — signal undeclared_sig is not declared before assignment, verify semantic analysis detects the undeclared name reference error
-- Expected Result: Triggers semantic error on undeclared identifier reference
-- Dependencies: None
-- =============================================================
entity bid_undeclared_ref is
  port (
    bad_val : out integer
  );
end entity bid_undeclared_ref;

architecture rtl of bid_undeclared_ref is
  signal valid_sig : integer := 0;
begin
  bad_val <= undeclared_sig;
end architecture rtl;
