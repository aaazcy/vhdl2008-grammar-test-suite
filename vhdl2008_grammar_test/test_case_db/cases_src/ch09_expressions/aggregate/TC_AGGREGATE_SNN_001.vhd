-- =============================================================
-- Case ID: TC_AGGREGATE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Negative
-- Test Focus: SNN: missing closing parenthesis — aggregate "(0 => '1'" has an opening parenthesis but no closing parenthesis, verifying that aggregate parentheses must be paired and closed
-- Expected Result: Triggers syntax error: missing closing ")" in aggregate
-- Dependencies: None
-- =============================================================
entity ent_snn_no_close is
  port (
    y_o : out bit_vector(3 downto 0)
  );
end entity ent_snn_no_close;

architecture rtl of ent_snn_no_close is
begin
  -- ERROR: missing closing parenthesis in aggregate
  y_o <= (0 => '1', others => '0';
end architecture rtl;
