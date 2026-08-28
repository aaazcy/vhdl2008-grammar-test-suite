-- =============================================================
-- Case ID: TC_IDENTIFIER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Negative
-- Test Focus: Reserved word entity used as a signal name — a reserved word cannot be used as basic_identifier, but can be bypassed with \entity\ (extended_identifier)
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity id_sem_001 is
  port (
    val_out : out integer
  );
end entity id_sem_001;

architecture rtl of id_sem_001 is
  signal entity : integer := 0;
begin
  entity <= 5;
  val_out <= entity;
end architecture rtl;
