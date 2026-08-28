-- =============================================================
-- Case ID: TC_DESIGN_FILE_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_DESIGN_FILE_ORDER
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_file ::= design_unit { design_unit }
-- Case Type: Positive
-- Rule Description: design_units in a design_file are analyzed sequentially in order of appearance; later design_units may reference entities defined earlier
-- Test Focus: cross-design_unit reference: the first design_unit defines an entity, and the architecture of the second design_unit instantiates the first entity — verifying the entity defined by the earlier design_unit in the design_file is visible to later design_units
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Design unit 1: defines component entity
entity df_sem_sub_ent is
  port (
    a : in  bit;
    b : in  bit;
    y : out bit
  );
end entity df_sem_sub_ent;

architecture rtl of df_sem_sub_ent is
begin
  y <= a and b;
end architecture rtl;

-- Design unit 2: instantiates the previous entity
entity df_sem_top_ent is
  port (
    x1 : in  bit;
    x2 : in  bit;
    x3 : in  bit;
    x4 : in  bit;
    y  : out bit
  );
end entity df_sem_top_ent;

architecture rtl of df_sem_top_ent is
  signal s_and1 : bit;
  signal s_and2 : bit;
begin
  u1: entity work.df_sem_sub_ent
    port map(a => x1, b => x2, y => s_and1);
  u2: entity work.df_sem_sub_ent
    port map(a => x3, b => x4, y => s_and2);
  y <= s_and1 or s_and2;
end architecture rtl;
