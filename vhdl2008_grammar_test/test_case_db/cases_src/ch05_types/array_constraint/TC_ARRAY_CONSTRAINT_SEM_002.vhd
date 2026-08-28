-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Positive
-- Test Focus: SEMANTIC -- array_constraint with (open) form indicating
--            an unconstrained array dimension. Tests that the (open)
--            syntax correctly defers the index constraint to the
--            object declaration, allowing flexible sizing.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_con_sem_open is
  port (
    dout : out integer
  );
end entity arr_con_sem_open;
architecture rtl of arr_con_sem_open is
  type t_matrix is array (integer range <>, integer range <>) of integer;
  subtype t_row is t_matrix(open);
  signal s_row : t_row(0 to 7, 0 to 3);
  signal s_val : integer := 0;
begin
  process
  begin
    s_row(0, 0) <= 1;
    s_row(0, 1) <= 2;
    s_val <= s_row(0, 0) + s_row(0, 1);
    dout <= s_val;
    wait;
  end process;
end architecture rtl;
