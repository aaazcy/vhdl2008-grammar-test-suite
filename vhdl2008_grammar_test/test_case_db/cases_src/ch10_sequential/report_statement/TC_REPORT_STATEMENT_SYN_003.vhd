-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_REPORT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: report_statement ::= [ label : ] report expression [ severity expression ] ;
-- Case Type: Positive
-- Test Focus: with label: `log_msg: report "msg";` — verifying that the report statement may carry an optional label prefix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity report_labeled_ent is
  port (data : in bit_vector(7 downto 0); crc : out bit);
end entity report_labeled_ent;

architecture monitor of report_labeled_ent is
begin
  process(data) is
  begin
    data_log: report "Received: " & to_string(data);
    crc <= '0';
  end process;
end architecture monitor;
