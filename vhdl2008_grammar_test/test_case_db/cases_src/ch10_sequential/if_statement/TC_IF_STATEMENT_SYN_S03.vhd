-- =============================================================
-- Case ID: TC_IF_STATEMENT_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: Labeled if with compound boolean condition combining relational and logical operators — condition `(s_st = PROCESSING and s_cnt > 5) or s_st = DONE` exercises operator precedence with parentheses grouping, labeled `L_check` matching at end if; then body contains multi-statement reset sequence, elsif covers single-state transition, demonstrating labeled if_statement as a state-machine decoder driving two control outputs from a typed enumerated state input
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity if_fsm_decode_ent is port(
  clk     : in  bit;
  trigger : in  bit;
  state_o : out integer range 0 to 3;
  count_o : out integer range 0 to 15
); end entity;
architecture bh of if_fsm_decode_ent is
  type t_state is (INIT, PROCESSING, DONE);
  signal s_st  : t_state := INIT;
  signal s_cnt : integer range 0 to 15 := 0;
begin
  process(clk) begin
    if clk='1' and clk'event then
      L_check: if (s_st = PROCESSING and s_cnt > 5) or s_st = DONE then
        s_st  <= INIT;
        s_cnt <= 0;
      elsif s_st = INIT and trigger = '1' then
        s_st  <= PROCESSING;
        s_cnt <= s_cnt + 1;
      elsif s_st = PROCESSING then
        s_cnt <= s_cnt + 1;
      end if L_check;
    end if;
  end process;
  state_o <= t_state'pos(s_st);
  count_o <= s_cnt;
end architecture bh;
