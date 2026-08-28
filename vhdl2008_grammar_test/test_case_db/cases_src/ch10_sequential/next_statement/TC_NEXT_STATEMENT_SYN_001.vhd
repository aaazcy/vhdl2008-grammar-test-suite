-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_NEXT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Production: next_statement ::= [ label : ] next [ loop_label ] [ when condition ] ;
-- Case Type: Positive
-- Test Focus: Minimal form: only `next;` keyword + semicolon, no label, no loop_label, no when condition — skips the rest of the current iteration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity next_minimal_ent is
  port (
    mask   : in  bit_vector(7 downto 0);
    count  : out integer range 0 to 8
  );
end entity next_minimal_ent;

architecture rtl of next_minimal_ent is
begin
  process(mask) is
    variable v_cnt : integer range 0 to 8 := 0;
  begin
    v_cnt := 0;
    for i in 0 to 7 loop
      if mask(i) = '0' then
        next;
      end if;
      v_cnt := v_cnt + 1;
    end loop;
    count <= v_cnt;
  end process;
end architecture rtl;
