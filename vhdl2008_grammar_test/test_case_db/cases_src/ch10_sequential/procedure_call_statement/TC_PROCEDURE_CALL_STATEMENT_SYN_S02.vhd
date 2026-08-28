-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call_statement ::= [ label : ] procedure_call ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: using procedure_call_statement to send a byte in a UART transmitter — production-grade use of procedure calls in a real hardware design
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_stmt_uart_ent is
  port (
    tx_byte  : in  bit_vector(7 downto 0);
    tx_start : in  bit;
    tx_busy  : out bit
  );
end entity proc_stmt_uart_ent;

architecture uart of proc_stmt_uart_ent is
  signal s_shift : bit_vector(7 downto 0) := (others => '0');
  signal s_busy  : bit := '0';
begin
  process(tx_byte, tx_start) is
    procedure start_transmit(data : in bit_vector(7 downto 0)) is
    begin
      s_shift <= data;
      s_busy <= '1';
    end procedure;

    procedure finish_transmit is
    begin
      s_busy <= '0';
    end procedure;
  begin
    if tx_start = '1' and s_busy = '0' then
      send_byte: start_transmit(tx_byte);
    end if;
    if s_busy = '1' then
      done_send: finish_transmit;
    end if;
  end process;
  tx_busy <= s_busy;
end architecture uart;
