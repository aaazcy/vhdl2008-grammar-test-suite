-- =============================================================
-- Case ID: TC_LOGICAL_NAME_LIST_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_LOGICAL_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name_list ::= logical_name { , logical_name }
-- Case Type: Positive
-- Test Focus: SEMANTIC: logical_name_list elements used in a generate loop
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- SEMANTIC: logical_name_list elements used in a generate loop
entity lnl_sem_generate is port(dout:out integer); end entity;
architecture rtl of lnl_sem_generate is
  type t_names is array(0 to 1) of string(1 to 10);
  constant C_NAMES : t_names := ("proc_a0000","proc_b0000");
  signal s_a:integer:=1; signal s_b:integer:=2;
begin
  g: for i in 0 to 1 generate
    s_a <= s_a + i;
  end generate;
  dout <= s_a + s_b;
end architecture;