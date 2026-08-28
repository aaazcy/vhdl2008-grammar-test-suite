-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Case Type: Positive
-- Test Focus: postponed concurrent procedure call — `postponed log_state(s_cur);` calls the procedure at the end of the simulation cycle, verifying the syntax of a postponed concurrent procedure call
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cpc_postponed_ent is
  port(clk : in bit; din : in bit_vector(3 downto 0); state_out : out integer);
end entity cpc_postponed_ent;
architecture bh of cpc_postponed_ent is
  signal s_cur : integer := 0;
  procedure log_state(signal s : in integer) is
  begin
    report "state = " & integer'image(s);
  end procedure log_state;
begin
  postponed log_state(s_cur);
  process(clk) is
  begin
    if clk'event and clk = '1' then
      s_cur <= s_cur + 1;
    end if;
  end process;
  state_out <= s_cur;
end architecture bh;
