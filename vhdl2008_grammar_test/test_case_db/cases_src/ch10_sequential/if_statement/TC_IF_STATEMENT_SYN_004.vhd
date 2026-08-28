-- =============================================================
-- Case ID: TC_IF_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: Simple if-then-else with distinct then and else branches each containing a single assignment — condition `ready='1'` gates data_in to data_out, else branch zeroes output; no label, no elsif, exercsing the minimal if-then-else form with std_logic ports demonstrating a transparent latch/mux pattern in data-flow style
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity if_mux_pass_ent is port(
  ready   : in  bit;
  data_in : in  integer range 0 to 255;
  data_out: out integer range 0 to 255
); end entity;
architecture bh of if_mux_pass_ent is
begin
  process(ready, data_in) begin
    if ready = '1' then
      data_out <= data_in;
    else
      data_out <= 0;
    end if;
  end process;
end architecture bh;
