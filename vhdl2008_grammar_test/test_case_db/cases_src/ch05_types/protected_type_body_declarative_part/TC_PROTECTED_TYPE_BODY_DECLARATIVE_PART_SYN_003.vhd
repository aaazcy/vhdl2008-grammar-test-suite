-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::=
--   { protected_type_body_declarative_item }
-- Test Focus: Multiple heterogeneous items — variable, constant,
--   subtype, and type declarations all before method bodies.
--   Exercises the repetition aspect with varied item kinds.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_dp_multi_hetero is
  port (
    tick  : in  bit;
    delta : out integer
  );
end entity pt_body_dp_multi_hetero;

architecture rtl of pt_body_dp_multi_hetero is
  type t_sequencer is protected
    procedure step;
    impure function pos return integer;
  end protected;
  type t_sequencer is protected body
    constant C_STEP : integer := 5;
    subtype t_idx is integer range 0 to 100;
    type t_dir is (UP, DOWN);
    variable v_pos : t_idx := 0;
    variable v_dir : t_dir := UP;
    procedure step is
    begin
      if v_dir = UP then
        v_pos := v_pos + C_STEP;
        if v_pos >= 100 then v_dir := DOWN; end if;
      else
        v_pos := v_pos - C_STEP;
        if v_pos <= 0 then v_dir := UP; end if;
      end if;
    end procedure;
    impure function pos return integer is
    begin
      return v_pos;
    end function;
  end protected body;
  shared variable sv : t_sequencer;
begin
  process(tick)
  begin
    if tick'event and tick = '1' then
      sv.step;
      delta <= sv.pos;
    end if;
  end process;
end architecture rtl;
