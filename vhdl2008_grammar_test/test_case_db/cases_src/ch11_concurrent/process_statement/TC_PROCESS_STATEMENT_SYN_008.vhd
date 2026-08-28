-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Positive
-- Test Focus: Labeled process without "is" keyword and without declarative part — the simplest labeled form p_sync:process(clk) begin ... end process; with no is and no declarative items, validating that process_label may be combined with a fully minimal body (no is, no declarative items) and the closing label may be omitted
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_lbl_min_ent is
  port(clk, d : in bit; q : out bit);
end entity proc_lbl_min_ent;
architecture bh of proc_lbl_min_ent is
begin
  p_sync : process(clk)
  begin
    if clk'event and clk = '1' then
      q <= d;
    end if;
  end process;
end architecture bh;
