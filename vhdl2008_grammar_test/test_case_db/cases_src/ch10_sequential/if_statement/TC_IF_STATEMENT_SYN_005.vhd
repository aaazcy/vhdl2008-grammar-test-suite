-- =============================================================
-- Case ID: TC_IF_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: If-statement as body of a for-loop iterating over integer range 0 to 7 — each iteration checks loop index parity with if-then-else assigning corresponding bit in an 8-bit std_logic_vector accumulator; demonstrates if_statement embedded inside loop_statement context where condition depends on loop variable, producing per-iteration branching without dead declarations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity if_loop_parity_ent is port(
  start : in  bit;
  bits  : out bit_vector(7 downto 0)
); end entity;
architecture bh of if_loop_parity_ent is
begin
  process(start) begin
    if start = '1' then
      for i in 0 to 7 loop
        if i mod 2 = 0 then
          bits(i) <= '0';
        else
          bits(i) <= '1';
        end if;
      end loop;
    end if;
  end process;
end architecture bh;
