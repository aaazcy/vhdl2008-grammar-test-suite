-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: block_declarative_part with type, constant, and signal declarations + process-based FSM exercising all declared items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_decl_ent is
  port(clk, rst : in bit; count : out integer);
end entity blk_decl_ent;
architecture rtl of blk_decl_ent is
begin
  blk_ctr : block is
    type t_state is (IDLE, COUNTING, DONE_ST);
    constant C_MAX : integer := 15;
    signal s_state : t_state := IDLE;
    signal s_cnt   : integer range 0 to C_MAX := 0;
  begin
    process(clk, rst)
    begin
      if rst = '0' then
        s_state <= IDLE;
        s_cnt   <= 0;
      elsif clk'event and clk = '1' then
        case s_state is
          when IDLE =>
            s_state <= COUNTING;
          when COUNTING =>
            s_cnt <= s_cnt + 1;
            if s_cnt = C_MAX then
              s_state <= DONE_ST;
            end if;
          when DONE_ST =>
            s_state <= IDLE;
        end case;
      end if;
    end process;
    count <= s_cnt;
  end block blk_ctr;
end architecture rtl;
