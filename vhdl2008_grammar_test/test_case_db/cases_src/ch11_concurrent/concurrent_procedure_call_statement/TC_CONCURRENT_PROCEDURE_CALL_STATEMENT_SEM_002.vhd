-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Rule Description: A postponed concurrent procedure call executes at the end of each simulation cycle after all delta cycles have completed, seeing the final settled signal values
-- Case Type: Positive
-- Test Focus: a postponed procedure call executes at the end of the delta cycle — the postponed procedure records the final output value after settling, verifying that a concurrent procedure call modified by postponed triggers only after signals stabilize
-- Expected Result: Compiles successfully; postponed procedure sees settled values
-- Dependencies: None
-- =============================================================
entity cpc_sem2_ent is
  port(clk : in bit; state : in bit_vector(1 downto 0); flag : out bit);
end entity cpc_sem2_ent;
architecture bh of cpc_sem2_ent is
  signal s_stable_val : bit_vector(1 downto 0);
  procedure record_stable(signal s : in bit_vector(1 downto 0)) is
  begin
    if s = "11" then
      report "state reached max";
    end if;
  end procedure record_stable;
begin
  s_stable_val <= state;
  postponed record_stable(s_stable_val);
  flag <= '1' when state = "11" else '0';
end architecture bh;
