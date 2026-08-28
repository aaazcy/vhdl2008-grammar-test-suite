-- =============================================================
-- Case ID: TC_IDENTIFIER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Negative
-- Test Focus: basic_identifier starting with a digit — basic_identifier must start with a letter, a digit as first character is illegal
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity id_snn_001 is
  port (
    val_out : out integer
  );
end entity id_snn_001;

architecture rtl of id_snn_001 is
  signal 2bad_signal : integer := 0;
begin
  2bad_signal <= 5;
  val_out     <= 2bad_signal;
end architecture rtl;
