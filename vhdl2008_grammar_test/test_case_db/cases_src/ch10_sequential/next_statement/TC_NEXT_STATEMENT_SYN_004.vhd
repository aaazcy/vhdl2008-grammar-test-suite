-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_NEXT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Production: next_statement ::= [ label : ] next [ loop_label ] [ when condition ] ;
-- Case Type: Positive
-- Test Focus: with loop_label + when: `next outer when cond;` — combines loop_label and when condition, verifying that both optional clauses can be used together
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity next_label_when_ent is
  port (
    addr   : in  integer range 0 to 15;
    hit    : out boolean
  );
end entity next_label_when_ent;

architecture cache of next_label_when_ent is
  type t_cache_line is record
    tag  : integer range 0 to 15;
    valid : boolean;
  end record;
  type t_cache is array (0 to 3) of t_cache_line;
  signal s_cache : t_cache;
begin
  process(addr) is
    variable v_found : boolean := false;
  begin
    v_found := false;
    way_loop: for way in 0 to 3 loop
      next way_loop when not s_cache(way).valid;
      if s_cache(way).tag = addr then
        v_found := true;
      end if;
    end loop way_loop;
    hit <= v_found;
  end process;
end architecture cache;
