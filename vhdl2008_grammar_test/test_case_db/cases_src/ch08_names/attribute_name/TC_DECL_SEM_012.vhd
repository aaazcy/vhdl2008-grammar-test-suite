-- =============================================================
-- Case ID: TC_DECL_SEM_012
-- Rule Type: Semantic
-- Related Rule ID: SEM_NAME_005
-- Standard Reference: Chapter 8.6
-- Rule Summary: Attribute name prefix must belong to a class for which the attribute is defined
-- Case Type: Positive
-- Error Category: type_mismatch
-- Test Focus: Positive case: an array-type prefix uses the array predefined attributes such as length/left/right/high, and a scalar-type prefix uses the scalar predefined attributes such as pos/leftof — verifying that attribute_name is legal when the prefix type matches the attribute category of the attribute_designator
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Positive: Attribute names used with correct prefix classes
entity sem_name_005_ent is
  port (
    sig_in : in bit_vector(7 downto 0);
    sig_out : out integer
  );
end entity sem_name_005_ent;

architecture behav of sem_name_005_ent is
  type t_rgb is (RED, GREEN, BLUE);
  type t_buf is array(0 to 15) of bit;
  signal s_arr : bit_vector(7 downto 0);
  signal s_clk : bit;
  signal s_val : t_rgb := RED;
begin
  process
    variable v_len : integer;
    variable v_enum : t_rgb;
  begin
    -- Array attributes on array prefix: correct
    v_len := sig_in'length;    -- 'length on array
    v_len := sig_in'left;      -- 'left on array
    v_len := sig_in'right;     -- 'right on array
    v_len := s_arr'high;       -- 'high on array
    -- Scalar attributes on scalar prefix: correct
    v_len := t_rgb'pos(s_val); -- 'pos on type
    v_enum := t_rgb'leftof(s_val); -- 'leftof on type
    wait;
  end process;
  sig_out <= sig_in'length;
end architecture behav;
