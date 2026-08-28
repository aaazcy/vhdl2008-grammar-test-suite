-- =============================================================
-- Case ID: TC_IDENTIFIER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Negative
-- Test Focus: Space embedded in basic_identifier — identifiers cannot contain spaces, space is a separator, causing one identifier to be split into two tokens
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity id_snn_005 is
  port (
    val_out : out integer
  );
end entity id_snn_005;

architecture rtl of id_snn_005 is
  signal my signal : integer := 0;
begin
  my signal <= 5;
  val_out   <= my signal;
end architecture rtl;
