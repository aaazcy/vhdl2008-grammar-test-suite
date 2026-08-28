-- =============================================================
-- Case ID: TC_IF_STATEMENT_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: If-statement inside clocked process with async reset using rising_edge — outer if checks reset (async, highest priority), inner if-then-else computes next state based on increment enable; demonstrates if_statement hierarchy: async-reset-priority if wrapping a synchronous if, each with distinct condition semantics (edge vs level), producing a counter with enable in real RTL style
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity if_rtl_cntr_ent is port(
  clk    : in  bit;
  rst_n  : in  bit;
  inc_en : in  bit;
  count  : out integer range 0 to 31
); end entity;
architecture bh of if_rtl_cntr_ent is
  signal s_cnt : integer range 0 to 31 := 0;
begin
  process(clk, rst_n) begin
    if rst_n = '0' then
      s_cnt <= 0;
    elsif clk = '1' and clk'event then
      if inc_en = '1' then
        if s_cnt = 31 then
          s_cnt <= 0;
        else
          s_cnt <= s_cnt + 1;
        end if;
      end if;
    end if;
  end process;
  count <= s_cnt;
end architecture bh;
