-- =============================================================
-- Case ID: TC_IDENTIFIER_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Negative
-- Test Focus: Duplicate declaration of the same identifier in one architecture — VHDL forbids two objects in the same declarative region from using the same identifier
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity id_sem_002 is
  port (
    val_out : out integer
  );
end entity id_sem_002;

architecture rtl of id_sem_002 is
  signal dup_name : integer := 0;
  signal dup_name : bit := '0';
begin
  val_out <= dup_name;
end architecture rtl;
