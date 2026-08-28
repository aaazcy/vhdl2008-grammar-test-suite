-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic check — array constraint bounds are compatible with base type direction; tests that constraint ranges use correct direction keywords matching the index subtype
-- Expected Result: Compiles and runs correctly
-- Dependencies: None
-- =============================================================
entity array_ctr_sem1 is
  port(
    clk   : in  bit;
    addr  : in  natural range 0 to 15;
    dout  : out integer
  );
end entity;

architecture semantic_bounds of array_ctr_sem1 is
  type t_mem is array (natural range <>) of integer;
  -- Semantic: to-direction constraint on natural-indexed type (natural uses 'to' by default)
  subtype t_mem16 is t_mem(0 to 15);
  constant C_INIT : t_mem16 := (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  signal mem : t_mem16 := C_INIT;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      dout <= mem(addr) * 2;
    end if;
  end process;
end architecture;
