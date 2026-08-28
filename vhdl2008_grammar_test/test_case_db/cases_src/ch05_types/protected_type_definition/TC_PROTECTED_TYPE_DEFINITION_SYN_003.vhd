-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::=
--   protected_type_declaration | protected_type_body
-- Test Focus: Protected type definition with optional trailing
--   names on both declaration and body sides. The full type
--   definition includes matching optional names on both
--   the 'end protected' and 'end protected body' lines.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_def_named_both is
  port (
    gate : in  bit;
    q    : out bit
  );
end entity pt_def_named_both;

architecture rtl of pt_def_named_both is
  type t_latch is protected
    procedure set;
    procedure clr;
    impure function q_out return bit;
  end protected t_latch;
  type t_latch is protected body
    variable v_q : bit := '0';
    procedure set is begin v_q := '1'; end procedure;
    procedure clr is begin v_q := '0'; end procedure;
    impure function q_out return bit is begin return v_q; end function;
  end protected body t_latch;
  shared variable sv : t_latch;
begin
  process(gate)
  begin
    if gate'event and gate = '1' then
      sv.set;
      q <= sv.q_out;
    end if;
  end process;
end architecture rtl;
