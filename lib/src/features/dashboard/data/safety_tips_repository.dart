import 'package:emergen_sync/src/features/models/safety_tip_model.dart';

class SafetyTipsRepository {
  Future<List<SafetyTipModel>> getSafetyTips() async {
    return [
      const SafetyTipModel(
        title: 'Be Aware of Your Surroundings',
        description: 'Pay attention to your surroundings and be aware of who is around you.',
        image: 'assets/images/awareness.png',
      ),
      const SafetyTipModel(
        title: 'Trust Your Instincts',
        description: 'If a situation feels unsafe, it probably is. Remove yourself from the situation.',
        image: 'assets/images/instincts.png',
      ),
      const SafetyTipModel(
        title: 'Let Someone Know Your Plans',
        description: 'Tell a friend or family member where you are going and when you expect to be back.',
        image: 'assets/images/plans.png',
      ),
      const SafetyTipModel(
        title: 'Carry a Personal Safety Device',
        description: 'Consider carrying a personal safety device such as a whistle or pepper spray.',
        image: 'assets/images/device.png',
      ),
      const SafetyTipModel(
        title: 'Stay in Well-Lit Areas',
        description: 'Avoid walking alone at night in poorly lit areas.',
        image: 'assets/images/well_lit.png',
      ),
    ];
  }
}
