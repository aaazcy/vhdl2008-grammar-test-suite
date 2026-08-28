-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: exit outer_loop when in three-level nested loops - FIFO read/write loop search, verifying the ability of exit to jump out of the named outer loop in a complex nesting scenario
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity exit_fifo_search_ent is
  port (
    wr_ptr  : in  integer range 0 to 7;
    rd_val  : in  integer range 0 to 255;
    hit_idx : out integer range -1 to 7
  );
end entity exit_fifo_search_ent;

architecture fifo of exit_fifo_search_ent is
  type t_fifo is array (0 to 7) of integer range 0 to 255;
  signal s_buf : t_fifo := (others => 0);
begin
  process(wr_ptr, rd_val) is
    variable v_idx : integer range 0 to 7;
  begin
    v_idx := 0;
    search_loop: loop
      scan_loop: loop
        if s_buf(v_idx) = rd_val then
          exit search_loop when v_idx <= wr_ptr;
        end if;
        v_idx := v_idx + 1;
        exit scan_loop when v_idx > 7;
      end loop scan_loop;
      exit search_loop;
    end loop search_loop;
    if v_idx <= wr_ptr and s_buf(v_idx) = rd_val then
      hit_idx <= v_idx;
    else
      hit_idx <= -1;
    end if;
  end process;
end architecture fifo;
