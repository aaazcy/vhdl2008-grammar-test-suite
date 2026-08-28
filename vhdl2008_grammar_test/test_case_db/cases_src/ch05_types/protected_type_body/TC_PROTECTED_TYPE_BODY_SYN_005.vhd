-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::=
--   protected body
--     protected_type_body_declarative_part
--   end protected body [ protected_type_simple_name ]
-- Test Focus: Body with multiple constant, variable, and
--   subtype declarations. Tests that the body declarative
--   part supports all VHDL-2008 declarative items (constant,
--   variable, type, subtype) before method implementations.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_rich_decls is
  port (
    step   : in  bit;
    width  : out natural;
    scaled : out natural
  );
end entity pt_body_rich_decls;

architecture rtl of pt_body_rich_decls is
  type t_scaler is protected
    procedure next_step;
    impure function result return natural;
  end protected;
  type t_scaler is protected body
    constant C_BASE  : natural := 10;
    constant C_FACTOR : natural := 4;
    subtype t_range is natural range 0 to 1000;
    variable v_acc : t_range := 0;
    variable v_step_count : natural := 0;
    procedure next_step is
    begin
      v_step_count := v_step_count + 1;
      v_acc := (v_step_count * C_FACTOR) mod 1001;
    end procedure;
    impure function result return natural is
    begin
      return v_acc + C_BASE;
    end function;
  end protected body;
  shared variable sv_scl : t_scaler;
begin
  process(step)
  begin
    if step'event and step = '1' then
      sv_scl.next_step;
      width  <= 4;
      scaled <= sv_scl.result;
    end if;
  end process;
end architecture rtl;
