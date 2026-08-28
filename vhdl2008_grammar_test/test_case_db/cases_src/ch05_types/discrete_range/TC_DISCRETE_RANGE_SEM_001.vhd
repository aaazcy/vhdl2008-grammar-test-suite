-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Positive
-- Test Focus: SEMANTIC -- discrete_range used as case statement choice range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dr_sem_case is port(sel:in integer range 0 to 7; dout:out integer); end entity;
architecture rtl of dr_sem_case is
  signal s:integer:=0;
begin process(sel) begin case sel is when 0 to 3=>s<=1; when 4 to 7=>s<=2; end case; end process;
  dout<=s; end architecture;