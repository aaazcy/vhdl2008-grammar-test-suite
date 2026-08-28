-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Multiple assertion combination: two labeled assertion_statements used consecutively in a process, distinguished by different severity, verifying multiple labeled assertion statements can coexist
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_stmt_multi_ent is
  port (
    rx_data  : in  bit_vector(7 downto 0);
    rx_valid : in  boolean;
    rx_err   : out bit
  );
end entity assert_stmt_multi_ent;

architecture receiver of assert_stmt_multi_ent is
begin
  process(rx_data, rx_valid) is
    variable parity : bit := '0';
  begin
    parity_check: assert rx_data /= "00000000"
      report "Received zero data frame"
      severity warning;
    for i in rx_data'range loop
      parity := parity xor rx_data(i);
    end loop;
    frame_check: assert rx_valid
      report "Frame validation failed"
      severity error;
    rx_err <= parity;
  end process;
end architecture receiver;
