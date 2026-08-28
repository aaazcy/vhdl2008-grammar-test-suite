-- =============================================================
-- Case ID: TC_IDENTIFIER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Negative
-- Test Focus: Reference to an undeclared identifier — the architecture uses a signal name not defined in the declarative region, semantic analysis detects the undeclared identifier
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity id_smn_001 is
  port (
    val_out : out integer
  );
end entity id_smn_001;

architecture rtl of id_smn_001 is
  signal valid_sig : integer := 5;
begin
  val_out <= undeclared_signal;
end architecture rtl;
