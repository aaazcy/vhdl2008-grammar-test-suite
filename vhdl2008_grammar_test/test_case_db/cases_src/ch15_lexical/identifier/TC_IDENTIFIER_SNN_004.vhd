-- =============================================================
-- Case ID: TC_IDENTIFIER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Negative
-- Test Focus: Identifier with trailing underscore — basic_identifier cannot end with an underscore, underscore may appear only between letters or digits
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity id_snn_004 is
  port (
    val_out : out integer
  );
end entity id_snn_004;

architecture rtl of id_snn_004 is
  signal trailing_ : integer := 0;
begin
  trailing_ <= 5;
  val_out   <= trailing_;
end architecture rtl;
